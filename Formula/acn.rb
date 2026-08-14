class Acn < Formula
  desc "Terminal AI assistant for traceable knowledge sharing between agents"
  homepage "https://github.com/FTShare-Lab/agent-claim-network"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    depends_on macos: :big_sur

    on_arm do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.2.3/agent-claim-network-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "89841cabc80047c15d287cab6cc4d385e70c2d66735fb32f2b9c9e501d00f63d"
    end

    on_intel do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.2.3/agent-claim-network-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "0e459651d0ea8a0bd7058e7b5d2df681ec19152bd1aa52c70dab79031ea49603"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.2.3/agent-claim-network-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0ca05999b54e21459984aa1a2b4ba9a544a91a186a6d395b73ff57809731043"
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
