class CcProfiles < Formula
  desc "Run multiple Claude Code accounts in parallel from one shared setup"
  homepage "https://github.com/masnun-siam/cc-profiles"
  url "https://github.com/masnun-siam/cc-profiles/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "1ae05841daf641887e4292ec27dc0fe5cf793db45330105e9fcc5b3c5ff7db23"
  license "MIT"
  head "https://github.com/masnun-siam/cc-profiles.git", branch: "main"

  def install
    bin.install "bin/cc-profile"
    pkgshare.install "test.sh"
  end

  def caveats
    <<~EOS
      Create and enter a profile with:
        cc-profile work
      then run /login inside it. Your existing `claude` keeps its own account.

      To shorten it, use a shell alias rather than a binary on PATH —
      `cc` is the C compiler:
        echo "alias cc='cc-profile'" >> ~/.zshrc
    EOS
  end

  test do
    # Stub `claude` so the test never launches the real CLI or touches ~/.claude.
    (testpath/"bin").mkpath
    (testpath/"bin/claude").write <<~SH
      #!/bin/sh
      echo "$CLAUDE_CONFIG_DIR"
    SH
    chmod 0755, testpath/"bin/claude"
    ENV.prepend_path "PATH", testpath/"bin"
    ENV["CC_PROFILE_SRC"] = testpath/"src"
    ENV["CC_PROFILE_ROOT"] = testpath/"profiles"
    (testpath/"src/skills").mkpath

    assert_match "usage: cc-profile", shell_output("#{bin}/cc-profile 2>&1", 2)

    out = shell_output("#{bin}/cc-profile t1").strip
    assert_equal (testpath/"profiles/t1").to_s, out
    assert_predicate testpath/"profiles/t1/skills", :symlink?
  end
end
