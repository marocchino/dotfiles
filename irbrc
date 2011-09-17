require 'rubygems'
begin#{{{
	require 'ap'
	IRB::Irb.class_eval do
	  def output_value
		ap @context.last_value
	  end
	end
rescue LoadError => err
	warn "Couldn't load ap: #{err}"
end#}}}

begin#{{{
	require 'wirble'
	Wirble.init
	Wirble.colorize
rescue LoadError => err
	warn "Couldn't load Wirble: #{err}"
end#}}}

# logger setting for rails
require 'logger'
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  # log SQL to the Rails console
  Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT))
end

def vim file="."# {{{
	system "mvim #{file} &"
end# }}}

def ssh *server# {{{
	if server.size == 2
		system("ssh #{server*"@"}")
	elsif server.size == 1
		system("ssh #{server}")
	end
end# }}}

def open params="."# {{{
	system "open #{params} &"
end# }}}

def copy path, options={}# {{{
	from = options[:from] || "allods"
	to = options[:to] || "scaffold"
	Dir.glob("#{ENV["PWD"].sub(to,from)}/#{path}").each do |file|
		system "mkdir -p #{file.sub(from, to).sub(/[^\/]+$/, "")}; cp -r #{file} #{file.sub(from, to)}"
	end
end# }}}

def find extension_or_path, regexp, output=STDOUT # {{{
	root = RAILS_ROOT rescue ENV["PWD"]
	if extension_or_path.to_s =~ /[\.\*\/]/
		path = "#{root}/#{extension_or_path}"
	else
		path = "#{root}/**/*.#{extension_or_path}"
	end
	size = 0
	Dir.grop(path).each do |file|
		lines = File.read(file).split("\n").select do |line|
			line =~ regexp
		end
		unless line.size == 0
			hash = { :file => file, :match => lines}
			if output == STDOUT
				ap hash
			else
				output.put hash.to_yaml
			end
			size += 1
		end
		unless output == STDOUT
			output.close
		end
	end
	"found #{size} file(s)"
end# }}}

alias q exit

