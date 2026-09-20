class Acn < Formula
  desc "Terminal AI assistant for traceable knowledge sharing between agents"
  homepage "https://github.com/FTShare-Lab/agent-claim-network"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    on_arm do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.3.0/agent-claim-network-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "58d61e0bc8b51f5b97ad6599a41fcd5ec36467b90457f5d346f8af21b6022ce0"
    end

    on_intel do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.3.0/agent-claim-network-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "8a22643a3faba152958cfdc5bade5e4c876d81cb93a1b4b1149e69faac2118f2"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.3.0/agent-claim-network-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9187f7fec2d4276a6fa6151c3f604d829ab1f703a62de214d3e23e34f9cb7165"
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
