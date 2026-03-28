class Cc9s < Formula
  desc "A k9s-inspired TUI for managing Claude Code sessions, skills, and agents"
  homepage "https://github.com/kincoy/cc9s"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-darwin-amd64"
      sha256 "e3f65bedb6d6f55a9490b2311dd04c0bd41c3937a0ce714e43eeb191a6d0b6a2"
    end
    on_arm do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-darwin-arm64"
      sha256 "b0f46f2e729d84e65972e089a2a03d8c46353425a200b8551bc61452f99b2367"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-linux-amd64"
      sha256 "a759bf44457fa65ec86407c38754e53efffeb8de345c1945d2c3487960ca84ce"
    end
    on_arm do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-linux-arm64"
      sha256 "32663c16d623fe088f3fbdc84eb1cec8c94fb987f3f8284ac387eb786e5fb7e2"
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
