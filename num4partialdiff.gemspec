Gem::Specification.new do |s|
  s.name        = 'num4partialdiff'
  s.version     = '0.0.1'
  s.date        = '2023-08-13'
  s.summary     = "num for partial different"
  s.description = "numerical solution for partial differential equations"
  s.authors     = ["siranovel"]
  s.email       = "siranovel@gmail.com"
  s.homepage    = "http://github.com/siranovel/num4partialdifferent"
  s.metadata    = {
      'changelog_uri'     => s.homepage + '/blob/main/CHANGELOG.md',
      'documentation_uri' => "https://rubydoc.info/gems/#{s.name}/#{s.version}",
      'homepage_uri'      => s.homepage,
      'wiki_uri'          => 'https://github.com/siranovel/mydocs/tree/main/num4partidifferent',
  }
  s.license     = "MIT"
  s.files       = ["LICENSE", "Gemfile", "CHANGELOG.md", ".yardopts"]
  s.files       += Dir.glob("{lib,ext}/**/*")
  s.extensions  = %w[ext/num4partialdiff/Rakefile]
  s.add_dependency 'ffi-compiler', '~> 1.0', '>= 1.0.1'
  s.add_development_dependency 'rake', '~> 12.3', '>= 12.3.3'
end
