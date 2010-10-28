# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{protect_via_honeypots}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Roy van der Meij"]
  s.date = %q{2010-10-28}
  s.description = %q{In the never ending battle with the form bots, here's my attempt to mislead them.
protect_via_honeypots creates some hidden fields. As normal users don't mess with hidden fields we can assume that when those fields are filled with data: a bot filled it.
So when that happens, protect_via_honeypots throws an error (as the same way protect_from_forgery does)}
  s.email = %q{roy@royapps.nl}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.textile"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.textile",
     "Rakefile",
     "VERSION",
     "init.rb",
     "lib/protect_via_honeypots.rb",
     "lib/protect_via_honeypots/form_tag_helper_extensions.rb",
     "test/helper.rb"
  ]
  s.homepage = %q{http://github.com/roy/hello-gem}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Protect your apps for bots via honeypots}
  s.test_files = [
    "test/helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end

