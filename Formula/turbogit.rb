# This file was generated by GoReleaser. DO NOT EDIT.
class Turbogit < Formula
  desc "Cli tool built to help you deal with your day-to-day git work"
  homepage "https://github.com/b4nst/turbogit"
  version "1.2.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/b4nst/turbogit/releases/download/v1.2.0/turbogit_1.2.0_macOS_amd64.tar.gz"
    sha256 "1fb0b27ce419d1bcdd16f3cf314263bd593cc1312478f29092e45efe8b39bde4"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/b4nst/turbogit/releases/download/v1.2.0/turbogit_1.2.0_linux_amd64.tar.gz"
    sha256 "9e8af2abcbaf00f37d7556e0cb40f005311d49ee7bdd98bbf6aa95eebc2bd970"
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url "https://github.com/b4nst/turbogit/releases/download/v1.2.0/turbogit_1.2.0_linux_arm64.tar.gz"
    sha256 "b557b81e29cbd1b5c90c0e54c0a870c8ec9907c5f4c0e091a06b3aee8a9e7a3b"
  end
  
  head do
    url "https://github.com/b4nst/turbogit.git"
    depends_on "go"
  end

  def install
    bin.install "bin/tug"
    etc.install "config/tug.toml"
    (bash_completion/"tug.sh").write `#{bin}/tug completion bash`
    (zsh_completion/"_tug").write `#{bin}/tug completion zsh`
    (fish_completion/"tug.fish").write `#{bin}/tug completion fish`
  end

  test do
    help_text = shell_output("#{bin}/tug --help")
    assert_includes help_text, "Usage:"
  end
end
