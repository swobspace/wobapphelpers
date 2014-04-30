module Wobapphelpers
  module Breadcrumbs
    autoload :ActionController, 'wobapphelpers/breadcrumbs/action_controller.rb'
    autoload :BreadcrumbsHelper, 'wobapphelpers/breadcrumbs/breadcrumbs_helper.rb'
    
    ::ActionController::Base.send :include, Wobapphelpers::Breadcrumbs::ActionController
    ::ActionView::Base.send :include, Wobapphelpers::Breadcrumbs::BreadcrumbsHelper
  end
end
