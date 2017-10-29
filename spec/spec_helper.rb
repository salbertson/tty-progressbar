if ENV['COVERAGE'] || ENV['TRAVIS']
  require 'simplecov'
  require 'coveralls'

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]

  SimpleCov.start do
    command_name 'spec'
    add_filter 'spec'
  end
end

require 'timecop'
require 'tty-progressbar'
require 'tty-screen'

puts "#####################################################"
puts "TERMINAL SIZE: >>> #{TTY::Screen.size}"
puts "JAVA SIZE: >>> #{TTY::Screen.size_from_java}"
puts "WIN API SIZE: >>> #{TTY::Screen.size_from_win_api}"
puts "IOCTL SIZE: >>> #{TTY::Screen.size_from_ioctl}"
puts "IO CONSOLE SIZE: >>> #{TTY::Screen.size_from_io_console}"
puts "READLINE SIZE: >>> #{TTY::Screen.size_from_readline}"
puts "TPUT SIZE: >>> #{TTY::Screen.size_from_tput}"
puts "STTY SIZE: >>> #{TTY::Screen.size_from_stty}"
puts "ENV SIZE: >>> #{TTY::Screen.size_from_env}"
puts "ANSICON SIZE: >>> #{TTY::Screen.size_from_ansicon}"
puts "#####################################################"


RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # Limits the available syntax to the non-monkey patched syntax that is recommended.
  config.disable_monkey_patching!

  # This setting enables warnings. It's recommended, but in some cases may
  # be too noisy due to issues in dependencies.
  config.warnings = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 2

  config.order = :random

  Kernel.srand config.seed
end
