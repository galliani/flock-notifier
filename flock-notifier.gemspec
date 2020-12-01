lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "flock/notifier/version"

Gem::Specification.new do |spec|
  spec.name          = 'flock-notifier'
  spec.version       = Flock::Notifier::VERSION
  spec.authors       = ['Galih Muhammad']
  spec.email         = ['galih.rubyist@gmail.com']

  spec.summary       = 'A simple ruby wrapper for posting to Flock webhooks'
  spec.description   = 'A simple ruby wrapper for posting to Flock webhooks'
  spec.homepage      = 'http://github.com/galliani/flock-notifier'
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri']     = spec.homepage
  spec.metadata['source_code_uri']  = 'http://github.com/galliani/flock-notifier'
  spec.metadata['changelog_uri']    = 'http://github.com/galliani/flock-notifier'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',  '~> 2.0'
  spec.add_development_dependency 'rake',     '~> 10.0'
  spec.add_development_dependency 'rspec',    '~> 3.0'
  spec.add_development_dependency 'webmock',  '~> 3.10.0'
end
