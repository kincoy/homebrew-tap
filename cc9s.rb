class Cc9s < Formula
  desc "A k9s-inspired TUI for managing Claude Code sessions, skills, and agents"
  homepage "https://github.com/kincoy/cc9s"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-darwin-amd64"
      sha256 "eb7043d0a5cd82e8f7cee437290f2e4a00604b5a3d3ea810eac1c4f4a5b50d55"
    end
    on_arm do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-darwin-arm64"
      sha256 "2a5fc71bf66db71e97915a8b48ab12c75446c84abc8021677afbde057b2cdd94"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-linux-amd64"
      sha256 "67eecee84c7954a873d4b0fa8767f6b616e200d8109fd0c5442c3ea8ad68c733"
    end
    on_arm do
      url "https://github.com/kincoy/cc9s/releases/download/v#{version}/cc9s-linux-arm64"
      sha256 "165d9ba09f40551c57dec50b9d2976d22eee3dae840cd18f69967da59f02a860"
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
