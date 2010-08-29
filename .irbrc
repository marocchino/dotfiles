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

def vim params="."# {{{
	system "mvim #{params} &"
end# }}}

def open params="."# {{{
	system "open #{params} &"
end# }}}

def find url, params="."# {{{
	Dir.grop(url)
end# }}}

alias q exit
