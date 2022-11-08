Gem::Specification.new do |s|
  s.name = "subcommand"
  s.version = "1.0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rahul Kumar"]
  s.description = "Subcommand and alias facility (wrapping OptionParser) for command line programs with elegant help printing"
  s.email = "oneness.univ@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc",
    "TODO"
  ]
  s.files = [
    ".document",
    "CHANGELOG.rdoc",
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
    "tests/test-lib.sh",
    "tests/test.rb",
    "tests/test1.rb"
  ]
  s.homepage = "http://github.com/rkumar/subcommand"
  s.require_paths = ["lib"]
  s.rubyforge_project = "subcommand"
  s.summary = "A tiny wrapper over OptionParser giving simple, elegant subcommand facility"

  if s.respond_to? :specification_version

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new("1.2.0")
      s.add_development_dependency("yard", [">= 0"])
    else
      s.add_dependency("yard", [">= 0"])
    end
  else
    s.add_dependency("yard", [">= 0"])
  end
  s.metadata["rubygems_mfa_required"] = "true"
end
