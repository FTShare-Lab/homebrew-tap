class Acn < Formula
  desc "Terminal AI assistant for traceable knowledge sharing between agents"
  homepage "https://github.com/FTShare-Lab/agent-claim-network"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    on_arm do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.3.1/agent-claim-network-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "7d0186b23e30aa9278fade42106a106698f55d95aa107a433461a14a045130e2"
    end

    on_intel do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.3.1/agent-claim-network-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "d1dcdf9f5ebe8f1229dbc9f5234cb39b36ae6315f551b4ce94cc69a51cc75d90"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/FTShare-Lab/agent-claim-network/releases/download/v0.3.1/agent-claim-network-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e4742bdde967a443eadcda6d58f6d88461605c0304becedb90f1cdba49c2e346"
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
