class Acn < Formula
  desc "Terminal AI assistant for traceable knowledge sharing between agents"
  homepage "https://github.com/FTShare-Lab/agent-claim-network"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    depends_on macos: :big_sur

    on_arm do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.2.2/agent-claim-network-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "678e1249c2a428161f55722331e4153e9c166ab215c92f6d17de8da6c4a8bf47"
    end

    on_intel do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.2.2/agent-claim-network-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "24dda009839675d68cc2b1b8f2e347c66618ec3ae63e48b9688811cd6a2133cb"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.2.2/agent-claim-network-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd11bae164e691c0bc5bee0770e492fda97d8a84203e39162c65f392afbee798"
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
