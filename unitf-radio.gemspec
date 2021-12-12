# frozen_string_literal: true

require_relative "lib/unitf/radio/version"

Gem::Specification.new do |spec|
  spec.name          = "unitf-radio"
  spec.version       = UnitF::Radio::VERSION
  spec.authors       = ["Matt Baron"]
  spec.email         = ["mwb@unitf.net"]

  spec.summary       = "Audio archiving"
  spec.description   = spec.summary
  spec.homepage      = "http://www.github.com/mattbaron"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://www.github.com/mattbaron"
  spec.metadata["changelog_uri"] = "http://www.github.com/mattbaron"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "nokogiri"
  spec.add_dependency "unitf-logging"
end
