class Turbogit < Formula
  desc "Opinionated cli enforcing clean git workflow without comprising UX"
  homepage "https://b4nst.github.io/turbogit"
  url "https://github.com/b4nst/turbogit.git",
      tag:      "v3.1.1",
      revision: "bf778142900c0109816721bb44791a97816189bc"
  license "MIT"
  head "https://github.com/b4nst/turbogit.git"

  bottle do
    root_url "https://github.com/b4nst/homebrew-tap/releases/download/turbogit-3.1.1"
    sha256 cellar: :any,                 catalina:     "793d736fddd95708f243c882269b0925a3eec7e417093e7d8e63fe47bfb5ab67"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f9ccda6fb98920b203bfeec3619b75592dee46e13283f7daa3c55abed9bbc37c"
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
