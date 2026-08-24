class Acn < Formula
  desc "Terminal AI assistant for traceable knowledge sharing between agents"
  homepage "https://github.com/FTShare-Lab/agent-claim-network"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    depends_on macos: :big_sur

    on_arm do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.2.5/agent-claim-network-v0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "aa407522715d826c5dbb42a829f1cd9736316c404ddd52f22c636af106dc9701"
    end

    on_intel do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.2.5/agent-claim-network-v0.2.5-x86_64-apple-darwin.tar.gz"
      sha256 "fd3355c1356e9c68f092d9bc6a79fe617192b1c16e00f6b9440a08f406cd8154"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.2.5/agent-claim-network-v0.2.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a29624dd671da20b2ecba71707f4eff5385eee286278b16047134126ca506f2"
    end
  end

  def install
    bin.install "bin/acn", "bin/acn-router", "bin/acn-maintainer"
    (pkgshare/"maintainer-workbench").install Dir["share/acn/maintainer-workbench/*"]
    prefix.install "README.md", "README_EN.md", "LICENSE-APACHE", "LICENSE-MIT"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/acn --version")
    assert_match version.to_s, shell_output("#{bin}/acn-router --version")
    assert_match version.to_s, shell_output("#{bin}/acn-maintainer --version")
    assert_path_exists pkgshare/"maintainer-workbench/app.html"
  end
end
