#!/usr/bin/ruby
# The idea is to capture an initial snapshot of the app according to
# its module

require 'optparse'
options = {}
applications = []
application = ["ccmg", "ccmgr"]
option_parser = OptionParser.new do |opts|
    executable_name = File.basename($PROGRAM_NAME)
    opts.banner = "Makes a copy of the config files for cisco applications which can then be used by SCM
    Usage: #{executable_name} [options]
        Options:"
    opts.on("-a APPS",'Comma separated list of apps to be collected', Array) do |application|
        applications = application
    end
    opts.on("-n NODE", 'Hostname of the server from which the config files will be retrieved') do |node|
        options[:server] = node
    end
end
# TODO Pretty much everything else
begin
    option_parser.parse!
    puts applications
    puts options.inspect
rescue OptionParser::InvalidArgument => ex
    STDERR.puts ex.message
    STDERR.puts option_parser
end
