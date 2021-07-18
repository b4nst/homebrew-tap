class Turbogit < Formula
  desc "Opinionated cli enforcing clean git workflow without comprising UX"
  homepage "https://b4nst.github.io/turbogit"
  url "https://github.com/b4nst/turbogit.git",
      tag:      "v3.0.0",
      revision: "ab354e46723d82f5d9d656b3e90574276cd369ca"
  license "MIT"
  head "https://github.com/b4nst/turbogit.git"

  bottle do
    root_url "https://github.com/b4nst/homebrew-tap/releases/download/turbogit-3.0.0"
    sha256 cellar: :any,                 catalina:     "5c90ee0d3247d3ea5a3901bc1714c96893c456beedc43752240922612c79c8db"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6779a95ac1d9a561fc3db74deffad24154cbe8d6100efb0080ca10b7079c09ce"
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
