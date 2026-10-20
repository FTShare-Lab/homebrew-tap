class Acn < Formula
  desc "Terminal AI assistant for traceable knowledge sharing between agents"
  homepage "https://github.com/FTShare-Lab/agent-claim-network"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    on_arm do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.3.3/agent-claim-network-v0.3.3-aarch64-apple-darwin.tar.gz"
      sha256 "b4f5b0ff5e5d7094d6579ad72f7af638a4ca87d5136ab9851da8f09c1d13b351"
    end

    on_intel do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.3.3/agent-claim-network-v0.3.3-x86_64-apple-darwin.tar.gz"
      sha256 "765a6a46ed0474c00ab4fba7ffc7c3c3adf8a1373600e55819f5cbfbe86078d2"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.3.3/agent-claim-network-v0.3.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3fb5d2ac45c68ee03dc2b2ecc8e9d0c62f1db59475e94fb3e2a34867620fce19"
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
