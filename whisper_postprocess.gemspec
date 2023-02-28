# frozen_string_literal: true

require_relative "lib/whisper_postprocess/version"

Gem::Specification.new do |spec|
  spec.name          = "whisper_postprocess"
  spec.version       = WhisperPostprocess::VERSION
  spec.authors       = ["Yugo TERADA"]
  spec.email         = ["yugo@18th-lab.com"]

  spec.summary       = "Post process whisper output file"
  spec.description   = "Post process whisper output file"
  spec.homepage      = "https://github.com/aspick/whisper_postprocess"
  spec.required_ruby_version = ">= 2.6.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # spec.files = Dir.chdir(File.expand_path(__dir__)) do
  #   `git ls-files -z`.split("\x0").reject do |f|
  #     (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
  #   end
  # end
  spec.files = %w(
    lib/whisper_postprocess.rb
    lib/whisper_postprocess/cue.rb
    lib/whisper_postprocess/formatter/base_formatter.rb
    lib/whisper_postprocess/formatter/simple_formatter.rb
    lib/whisper_postprocess/version.rb
  )
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
