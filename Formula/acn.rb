class Acn < Formula
  desc "Terminal AI assistant for traceable knowledge sharing between agents"
  homepage "https://github.com/FTShare-Lab/agent-claim-network"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    depends_on macos: :big_sur

    on_arm do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.2.1/agent-claim-network-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "a5ef6ed921d4fe8953d2383ab097261498d8961f8e5666965711058a966a6a11"
    end

    on_intel do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.2.1/agent-claim-network-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "f1c8d18c42564bb91472ba2c23479a3c78c00186d3dedca5bca1768272a65227"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.2.1/agent-claim-network-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b1767456d6f9b362388fac81e6b6fd99c3a0322e4d5424eab41c20f1a9801d26"
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
