require 'active_support/concern'

module Wobapphelpers
  module Breadcrumbs
    extend ActiveSupport::Concern

    autoload :ActionController, 'wobapphelpers/breadcrumbs/action_controller.rb'
    autoload :BreadcrumbsHelper, 'wobapphelpers/breadcrumbs/breadcrumbs_helper.rb'
    
    included do
      include Wobapphelpers::Breadcrumbs::ActionController
    end
  end
end

ActionView::Base.send :include, Wobapphelpers::Breadcrumbs::BreadcrumbsHelper
