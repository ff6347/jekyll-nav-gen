# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "jekyll-nav-gen"
  spec.version       = "0.1.0"
  spec.authors       = ["Fabian Morón Zirfas"]
  spec.email         = ["fabian.moron.zirfas@gmail.com"]
  spec.summary       = "Generate Nav for site."
  spec.description   = ""
  spec.homepage      = "https://github.com/fabianmoronzirfas/jekyll-nav-gen"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split.select { |s| s =~ /\.rb$/ }
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", '~> 3.0'
  spec.add_dependency 'nokogiri', '~> 1.8'
end