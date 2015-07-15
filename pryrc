# from https://gist.github.com/rondale-sc/1297510
default_command_set = Pry::CommandSet.new do
  command 'copy', 'Copy argument to the clip-board' do |str|
    IO.popen('pbcopy', 'w') { |f| f << str.to_s }
  end

  command 'clear' do
    system 'clear'
    output.puts "Rails: #{ENV['RAILS_ENV']}" if ENV['RAILS_ENV']
    output.puts "Ruby: #{RUBY_VERSION}"
  end

  command 'sql', 'Send sql over AR.' do |query|
    output.puts ActiveRecord::Base.connection.select_all(query)
  end

  command 'ar', 'Load ActiveSupport' do
    require 'active_support/all'
    output.puts 'ActiveSupport Loaded'
  end

  command 'load_ap', 'Load awesome_print' do
    require 'awesome_print'
    AwesomePrint.pry!
  end

  command 'caller_method' do |depth|
    depth = depth.to_i || 1
    if /^(.+?):(\d+)(?::in `(.*)')?/ =~ caller(depth + 1).first
      file   = Regexp.last_match[1]
      line   = Regexp.last_match[2].to_i
      method = Regexp.last_match[3]
      output.puts [file, line, method]
    end
  end
end

Pry.config.commands.import default_command_set
