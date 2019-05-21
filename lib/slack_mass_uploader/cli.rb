require 'optparse'

module SlackMassUploader
  class CLI
    attr_accessor :options

    def initialize(args)
      @options = parse(args)
    end

    def parse(args)
      options = {}
      opts = OptionParser.new do |opts|
        opts.banner = "Usage: slack-mass-uploader [options] FILE"
        opts.version = SlackMassUploader::VERSION

        opts.on( '-o', '--output-dir=NAME', 'Output directory.' ) do |val|
          options[:output_dir] = val
        end

        options[:silent] = false
        opts.on( '-s', '--silent', 'Silent or quiet mode.' ) do
          options[:silent] = true
        end

        options[:convert_only] = false
        opts.on( '-c', '--convert-only', 'Convert image but do not upload.' ) do
          options[:convert_only] = true
        end

        opts.on_tail( '-h', '--help', 'Show this message' ) do
          puts opts
          exit
        end
      end
      opts.parse! # removes switches destructively, but not non-options

      file = args.first # ARGV args only - no options

      # validates input to be one image file, no gif support (yet)
      abort "Error: Missing input file" unless file
      abort "Just specify one file" if args.count > 1

      options[:directory] = file

      options
    end

    def log(*msg)
      unless @options[:silent]
        if msg.size == 1
          puts msg
        else
          printf "%-20s %s\n", msg.first, msg.last
        end
      end
    end
  end
end
