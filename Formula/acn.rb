class Acn < Formula
  desc "Terminal AI assistant for traceable knowledge sharing between agents"
  homepage "https://github.com/FTShare-Lab/agent-claim-network"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    on_arm do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.3.2/agent-claim-network-v0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "9a9d33fa83c42f24fbc2af14f58e4712d125e317aa9af048f0cc2d4c5f08a37b"
    end

    on_intel do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.3.2/agent-claim-network-v0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "55a47e0eef5c7a3304cbd68c6686ea44c3e0931481bd8352c4a22cdda91e0c8c"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.3.2/agent-claim-network-v0.3.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "17800425d1b825dbbbb77f45ce254da3e87c5477178eca3ae3ae5fbee67a9ff6"
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
