class Cc9s < Formula
  desc "A k9s-inspired TUI for managing Claude Code sessions, skills, and agents"
  homepage "https://github.com/kincoy/cc9s"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-darwin-amd64"
      sha256 "ae7533db74d493188ea17a49ac4608e94f3f64588c5d31aa173648b8fe834e78"
    end
    on_arm do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-darwin-arm64"
      sha256 "7d2c48d77d8f2c731f5c83c30d2d10905a89812ea8e6c4178ea37f1de03987ac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-linux-amd64"
      sha256 "4ca306a6813990d04d0e240e01b8015beed5b63bab860b0c255f04346c09d23d"
    end
    on_arm do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-linux-arm64"
      sha256 "e75914fb577733e5a8fa99ddad52dd1c68e50d09f525d6cb6896e54fc1d78cc3"
    end
  end

  def install
    bin.install "cc9s-darwin-amd64" => "cc9s" if OS.mac? && Hardware::CPU.intel?
    bin.install "cc9s-darwin-arm64" => "cc9s" if OS.mac? && Hardware::CPU.arm?
    bin.install "cc9s-linux-amd64" => "cc9s" if OS.linux? && Hardware::CPU.intel?
    bin.install "cc9s-linux-arm64" => "cc9s" if OS.linux? && Hardware::CPU.arm?
  end

  test do
    assert_match "cc9s", shell_output("#{bin}/cc9s --help", 1)
  end
end
