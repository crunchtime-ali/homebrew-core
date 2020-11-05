class Yaegi < Formula
  desc "Yet another elegant Go interpreter"
  homepage "https://github.com/containous/yaegi"
  url "https://github.com/containous/yaegi/archive/v0.9.5.tar.gz"
  sha256 "d8e5f82f6c21e42816a3e91e0bcacb14cc93d45e1f7eaa91382f286de5f66209"
  license "Apache-2.0"
  head "https://github.com/containous/yaegi.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "1cd4f2becf89513ea1b8fb124886cb2a81ded72886bf7066270da5ec99f7c56e" => :catalina
    sha256 "27ae9f05feabb5935f4b6ed4c69bf19cd1adfe34a5da9997fa3065e8cd6cc0d0" => :mojave
    sha256 "d9186c3789eeb6104b415e2be0e3f126a39aed6addd81f33f19a336a9a434fdf" => :high_sierra
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "./cmd/yaegi"
  end

  test do
    assert_match "4", pipe_output("#{bin}/yaegi", "println(3 + 1)", 0)
  end
end
