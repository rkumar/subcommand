# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{subcommand}
  s.version = "1.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rahul Kumar"]
  s.date = %q{2010-06-24}
  s.description = %q{Subcommand and alias facility for command line programs with elegant help printing}
  s.email = %q{sentinel.1879@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc",
     "TODO"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "Makefile",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/subcommand.rb",
     "subcommand.gemspec",
     "tests/Makefile",
     "tests/README",
     "tests/aggregate-results.sh",
     "tests/recreate.sh",
     "tests/rtest2.sh",
     "tests/t0001-main.sh",
     "tests/t0002-subcomm.sh",
     "tests/t0003-inv_comm.sh",
     "tests/t0004-subcomm.sh",
     "tests/t0005-alias_goo.sh",
     "tests/t0006-goo_opt.sh",
     "tests/t0007-bar_baz.sh",
     "tests/t0008-boo_zoo.sh",
     "tests/test-lib.sh"
  ]
  s.homepage = %q{http://github.com/rkumar/subcommand}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{subcommand}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A tiny wrapper over OptionParser giving simple, elegant subcommand facility}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<yard>, [">= 0"])
  end
end

