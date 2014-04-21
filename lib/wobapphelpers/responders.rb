require 'action_controller'
require 'responders'

module Wobapphelpers
  class Responders < ActionController::Responder
    include ::Responders::FlashResponder
  end
end

# -- use own translations
require "active_support/i18n"
I18n.load_path += Dir[File.expand_path("../responders/locales/*.yml", __FILE__)]

