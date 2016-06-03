require "code_commenter/version"
require 'code_commenter/parser'
module CodeCommenter
  SUPPORTED_FILE_TYPES = ['rb', 'c', 'h', 'cpp', 'java', 'js']
  # Your code goes here...
  def self.parse(opts)
    if invalidOpts? opts
      puts opts
    else
      opts[:verbosity] = opts[:quiet] ? -1 : opts[:verbosity]
      CodeCommenter::Parser.open opts
    end
  end

  private
    def self.invalidOpts?(opts)
      return (opts.arguments.count == 0 && opts[:extension] == nil) || opts[:verbosity] > 2
    end
end
