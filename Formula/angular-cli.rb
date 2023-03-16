require "language/node"

class AngularCli < Formula
  desc "CLI tool for Angular"
  homepage "https://cli.angular.io/"
  url "https://registry.npmjs.org/@angular/cli/-/cli-15.2.4.tgz"
  sha256 "a634c7cc4106968b6d5b5feac3e944ed783bb826229ccde76e395a0f8841e977"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "674244ac86d79757a67b5cffec3c9bd43f16bf254332ca7cbb219372d8ddd347"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "674244ac86d79757a67b5cffec3c9bd43f16bf254332ca7cbb219372d8ddd347"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "674244ac86d79757a67b5cffec3c9bd43f16bf254332ca7cbb219372d8ddd347"
    sha256 cellar: :any_skip_relocation, ventura:        "d568a55bbe0451a602a5b5be7c5cacc0494d6c50d16418960bc382986536431f"
    sha256 cellar: :any_skip_relocation, monterey:       "d568a55bbe0451a602a5b5be7c5cacc0494d6c50d16418960bc382986536431f"
    sha256 cellar: :any_skip_relocation, big_sur:        "d568a55bbe0451a602a5b5be7c5cacc0494d6c50d16418960bc382986536431f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "674244ac86d79757a67b5cffec3c9bd43f16bf254332ca7cbb219372d8ddd347"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"ng", "new", "angular-homebrew-test", "--skip-install"
    assert_predicate testpath/"angular-homebrew-test/package.json", :exist?, "Project was not created"
  end
end
