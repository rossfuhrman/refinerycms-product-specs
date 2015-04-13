# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-product-specs'
  s.version           = '3.0.0'
  s.description       = 'Ruby on Rails Product specs extension for Refinery CMS'
  s.date              = '2014-04-13'
  s.summary           = 'Product specs extension for Refinery CMS'
  s.email             = ''
  s.homepage          = ''
  s.authors           = ['Ross Fuhrman']
  s.license           = %q{MIT}
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + Dir["{app/decorators/model/refinery/*"] + ["README.md"]

  # Runtime dependencies
  s.add_dependency    'refinerycms-core',            '~> 3.0.0'
  s.add_dependency    'refinerycms-page-images',     '~> 3.0.0'
  s.add_dependency    'refinerycms-acts-as-indexed', '~> 2.0.0'
  s.add_dependency    'friendly_id',                  '~> 5.1.0'
  s.add_dependency    'globalize',                   ['>= 4.0.0', '< 5.2']
  s.add_dependency    'awesome_nested_set',          '~> 3.0.0'

  s.add_dependency    'acts_as_tree'
  s.add_dependency    'acts_as_list',          '~> 0.6.0'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 3.0.0'
end
