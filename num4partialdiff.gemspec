Gem::Specification.new do |s|
  s.name        = 'num4partialdiff'
  s.version     = '0.1.1'
  s.date        = '2025-05-15'
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
  s.required_ruby_version = ">= 3.0"
  s.files       = ["LICENSE", "Gemfile", "CHANGELOG.md", ".yardopts"]
  s.files       += Dir.glob("{lib,ext}/**/*")
  s.extensions  = %w[ext/num4partialdiff/Rakefile]
  s.add_dependency 'rake', '~> 13', '>= 13.0.6'
  s.add_development_dependency 'ffi-compiler', '~> 1.3', '>= 1.3.2'
end
