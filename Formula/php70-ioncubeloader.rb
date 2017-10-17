require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php70Ioncubeloader < AbstractPhp70Extension
  init
  desc "Loader for ionCube Secured Files"
  homepage "https://www.ioncube.com/loaders.php"
  url "https://downloads.ioncube.com/loader_downloads/ioncube_loaders_dar_x86-64.tar.gz"
  sha256 "cf7a5a1855427c6219645bdc3edef71ab6dc2641cec1d73fb6ca2101f54a7fcc"
  version "10.0.4"

  option "with-thread-safe", "Enable the thread-safe extenstion"

  bottle do
    cellar :any_skip_relocation
    sha256 "0e401659335a7592b7ff71b1db43f87e3b85a9506388a714e476a6982841fb1f" => :high_sierra
    sha256 "0e401659335a7592b7ff71b1db43f87e3b85a9506388a714e476a6982841fb1f" => :sierra
    sha256 "0e401659335a7592b7ff71b1db43f87e3b85a9506388a714e476a6982841fb1f" => :el_capitan
  end

  def extension_type
    "zend_extension"
  end

  def install
    prefix.install "ioncube_loader_dar_7.0.so" => "ioncubeloader.so" if build.without? "thread-safe"
    prefix.install "ioncube_loader_dar_7.0_ts.so" => "ioncubeloader_ts.so" if build.with? "thread-safe"
    write_config_file if build.with? "config-file"
  end

  test do
    shell_output("php -m").include?("ionCube")
  end
end
