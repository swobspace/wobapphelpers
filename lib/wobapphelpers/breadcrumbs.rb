module Wobapphelpers
  module Breadcrumbs
    autoload :ActionController, 'wobapphelpers/breadcrumbs/action_controller.rb'
    autoload :ActionView, 'wobapphelpers/breadcrumbs/action_view.rb'
    
    ::ActionController::Base.send :include, Wobapphelpers::Breadcrumbs::ActionController
    ::ActionView::Base.send :include, Wobapphelpers::Breadcrumbs::ActionView
  end
end
