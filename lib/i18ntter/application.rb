# -*- coding: utf-8 -*-

module I18ntter
  class Application
    def initialize
      @options = {}
      load File.expand_path("~/.i18ntter/config")
      Twitter.configure do |config|
        config.consumer_key = "ONMnSsNz80Da2vmkX5bA"
        config.consumer_secret = "x2qiGxhteXybB0eOzBfQ3X5r6hxedNSo7mTtSwcykkk"
        config.oauth_token = OAUTH_TOKEN
        config.oauth_token_secret = OAUTH_TOKEN_SECRET
      end
      @bing = BingTranslator.new '9AD9D7BCF837DE62EF364A24374765773DBA881F'
    end

    def handle_options
      opt = OptionParser.new
      opt.on('--env') { @options[:env] = true }
      opt.parse!(ARGV)
    end

    def run
      handle_options
      if @options[:env]
        require 'i18ntter/ffi'
        tweet = I18ntter::FFI.cpu_brand
      else
        tweet = gets
        tweet = @bing.translate tweet, :from => 'ja', :to =>'en'
      end
      puts tweet
      Twitter.update(tweet)
    end

  end
end
