class Turbogit < Formula
  desc "Opinionated cli enforcing clean git workflow without comprising UX"
  homepage "https://b4nst.github.io/turbogit"
  url "https://github.com/b4nst/turbogit.git",
      tag:      "v4.0.0",
      revision: "6991087eb96556723054ab2ca25f1f029f243ef0"
  license "MIT"
  head "https://github.com/b4nst/turbogit.git"

  bottle do
    root_url "https://github.com/b4nst/homebrew-tap/releases/download/turbogit-4.0.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "39635c4eae795eef11adbcc2bb83c58f9d1ac82671455461c55f57a4b5865b0e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2a55404642298ab94d94f1cacd342124cac693cfb297584555bc21fd3e65b012"
  end

  depends_on "cmake" => :build
  depends_on "go" => :build
  depends_on "pkg-config" => :build

  def install
    ENV["TUG_VERSION"] = version
    ENV.deparallelize
    system "make", "build"
    bin.install "dist/bin/tug"

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
