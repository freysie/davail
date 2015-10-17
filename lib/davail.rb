require_relative 'davail/version'

begin
  require 'pp'
  require 'yaml'
  require 'optparse'

  require 'active_support/core_ext/object/blank'
  require 'active_support/core_ext/hash/keys'

  require 'rainbow'
  require 'simpleidn'
  require 'whois'

  module Davail
    begin
      ALL_TLDS = Whois::Server.definitions[:tld].reject { |t| t[1].nil? }.map(&:first).freeze
    rescue Whois::Error => e
      puts Rainbow(e.message).yellow
      abort
    end

    DEFAULT_QUERIED_TLDS = %w[com net org co].freeze

    DEFAULT_RESULT_COLORS = {
      
    }.freeze

    ACTIVITY_INDICATORS = {
         slash: %w[ | / - \\ ],
        circle: %w[ ◐ ◓ ◑ ◒ ],
           bar: %w[ ▃ ▄ ▅ ▆ ▇ ▆ ▅ ▄ ],
          dots: %w[ ⣾ ⣽ ⣻ ⢿ ⡿ ⣟ ⣯ ⣷ ],
           dot: %w[ ⠁ ⠂ ⠄ ⡀ ⢀ ⠠ ⠐ ⠈  ],
         lines: %w[ ┤ ┘ ┴ └ ├ ┌ ┬ ┐ ]
      }.freeze

    RC_PATH = File.expand_path(File.join '~', '.davailrc').freeze
    RC_FILE = (YAML.load_file(RC_PATH).deep_symbolize_keys rescue {}).freeze

    DATE_FORMAT      = RC_FILE[:date_format]      || '%-d %b %Y'
    QUERIED_TLDS     = RC_FILE[:queried_tlds]     || DEFAULT_QUERIED_TLDS
    RESULT_COLORS    = RC_FILE[:result_colors]    || DEFAULT_RESULT_COLORS
    RESULT_SPARATOR  = RC_FILE[:result_separator] || "\n"
    RESULT_DELIMITER = RC_FILE[:result_delimiter] || ":  "
    ACTIVITY_STYLE   = RC_FILE[:activity_style]   || false
    SHOW_LOOKUP_TIME = RC_FILE[:show_lookup_time] || false
  end
rescue LoadError => e
  warn "#{File.basename $0}: Missing dependency: #{e.message.gsub /.* -- /, ''}"
  abort
rescue Interrupt
  puts
end
