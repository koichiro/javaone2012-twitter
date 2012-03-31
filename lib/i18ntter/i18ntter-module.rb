# -*- coding: utf-8 -*-
require "i18ntter/application"

module I18ntter
  class << self
    def application
      @application ||= I18ntter::Application.new
    end

    def application=(app)
      @application = app
    end
  end
end

