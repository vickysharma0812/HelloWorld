# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class HelloWorld < Formula
  desc "This program install HelloWorld Fortran program."
  homepage "https://github.com/vickysharma0812/HelloWorld.git"
  url "https://github.com/vickysharma0812/HelloWorld/archive/refs/tags/v23.09.0.tar.gz"
  sha256 "426273d8c27daf7bfe7bfe9d593dd583cc2e7c165f58f1aa501045f74b8b9141"
  license "MIT"
  version "23.09.0"

  # depends_on "cmake" => :build
  depends_on "gfortran"

  def install
    bin.install "helloworld"
    bin.install Dir["src"]
    bin.install "README.md"
    bin.install "LICENSE"
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "./configure", *std_configure_args, "--disable-silent-rules"
    system "gfortran", "./src/main.F90"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test v23.09.0`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
