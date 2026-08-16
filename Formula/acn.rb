class Acn < Formula
  desc "Terminal AI assistant for traceable knowledge sharing between agents"
  homepage "https://github.com/FTShare-Lab/agent-claim-network"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    depends_on macos: :big_sur

    on_arm do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.2.4/agent-claim-network-v0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "0dc38b682061472928ef3b41aa882c42b7555928c15f609b1188d5ca834cdf82"
    end

    on_intel do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.2.4/agent-claim-network-v0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "a6f4555f7857a656d663c689d4f28e82299f817ca13f04d978fcf5ebc9e9653e"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.2.4/agent-claim-network-v0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "65c00466dd557884a6c33de1c26b77c77bd7574046413e522db4140fb84e81c2"
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
