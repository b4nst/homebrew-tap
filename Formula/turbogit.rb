class Turbogit < Formula
  desc "Opinionated cli enforcing clean git workflow without comprising UX"
  homepage "https://b4nst.github.io/turbogit"
  url "https://github.com/b4nst/turbogit.git",
      tag:      "v3.1.1",
      revision: "bf778142900c0109816721bb44791a97816189bc"
  license "MIT"
  head "https://github.com/b4nst/turbogit.git"

  bottle do
    root_url "https://github.com/b4nst/homebrew-tap/releases/download/turbogit-3.0.1"
    sha256 cellar: :any,                 catalina:     "b46c89d8277cfbd80fd62ce9eb7b1b21f506c2eb02d9fcc42965bdaa22a42f9f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f24471db0df452f07df35c40e94996f5e929255fcbaf968a1edc7e4b91cd4fa9"
  end

  depends_on "go" => :build
  depends_on "pkg-config" => :build
  depends_on "libgit2"

  def install
    ENV["TUG_VERSION"] = version
    system "make", "build"
    bin.install "bin/tug"

    bash_output = Utils.safe_popen_read(bin/"tug", "completion", "bash")
    (bash_completion/"tug").write bash_output

    zsh_output = Utils.safe_popen_read(bin/"tug", "completion", "zsh")
    (zsh_completion/"_tug").write zsh_output

    fish_output = Utils.safe_popen_read(bin/"tug", "completion", "fish")
    (fish_completion/"tug.fish").write fish_output
  end

  test do
    version_output = shell_output("#{bin}/tug version 2>&1")
    assert_match "Version:\t#{version}", version_output
  end
end
