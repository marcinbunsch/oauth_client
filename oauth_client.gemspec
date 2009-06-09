# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{oauth_client}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marcin Bunsch, ""Richard Taylor"]
  s.date = %q{2009-06-09}
  s.description = %q{Generic OAuth Client for Ruby, based on moomerman/twitter_oauth}
  s.email = %q{marcin@applicake.com}
  s.files = ["README.textile", "lib/oauth_client.rb"]
  s.has_rdoc = false
  s.homepage = %q{http://github.com/marcinbunsch/oauth_client}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Generic OAuth Client for Ruby, based on moomerman/twitter_oauth.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oauth>, [">= 0.3.1"])
      s.add_runtime_dependency(%q<json>, [">= 1.1.2"])
      s.add_runtime_dependency(%q<mime-types>, [">= 1.15"])
    else
      s.add_dependency(%q<oauth>, [">= 0.3.1"])
      s.add_dependency(%q<json>, [">= 1.1.2"])
      s.add_dependency(%q<mime-types>, [">= 1.15"])
    end
  else
    s.add_dependency(%q<oauth>, [">= 0.3.1"])
    s.add_dependency(%q<json>, [">= 1.1.2"])
    s.add_dependency(%q<mime-types>, [">= 1.15"])
  end
end
