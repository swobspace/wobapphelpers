module Wobapphelpers
  module Breadcrumbs
    autoload :ActionController, 'wobapphelpers/breadcrumbs/action_controller.rb'
    autoload :ActionView, 'wobapphelpers/breadcrumbs/action_view.rb'
    
    ::ActionController::Base.send :include, Wobapphelpers::Breadcrumbs::ActionController
    ::ActionView::Base.send :include, Wobapphelpers::Breadcrumbs::ActionView
    ::ActionController::Base.send :before_action, "add_breadcrumb_index", only: :index
    ::ActionController::Base.send :around_action, "add_breadcrumb_show", only: :show
  end
end
