module Wobapphelpers
  module Breadcrumbs
    autoload :ActionController, 'wobapphelpers/breadcrumbs/action_controller.rb'
    autoload :BreadcrumbsHelper, 'wobapphelpers/breadcrumbs/breadcrumbs_helper.rb'
    
    ::ActionController::Base.send :include, Wobapphelpers::Breadcrumbs::ActionController
    ::ActionView::Base.send :include, Wobapphelpers::Breadcrumbs::BreadcrumbsHelper
    ::ActionController::Base.send :before_action, "add_breadcrumb_index", only: :index
    ::ActionController::Base.send :append_before_action, "add_breadcrumb_show", only: :show
  end
end
