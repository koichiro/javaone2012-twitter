# -*- coding: utf-8 -*-

module I18ntter
  class Application
    def initialize
    end

    def run
      init
      tweet = gets
      Twitter.update(tweet)
    end

    def init
      load File.expand_path("~/.i18ntter/config")
      Twitter.configure do |config|
        config.consumer_key = "ONMnSsNz80Da2vmkX5bA"
        config.consumer_secret = "x2qiGxhteXybB0eOzBfQ3X5r6hxedNSo7mTtSwcykkk"
        config.oauth_token = OAUTH_TOKEN
        config.oauth_token_secret = OAUTH_TOKEN_SECRET
      end
    end
  end
end
