class ApplicationController < ActionController::Base
  include Wobapphelpers::Breadcrumbs
  before_action :add_breadcrumb_index, only: [:index]

  self.responder = Wobapphelpers::Responders

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :html, :json

  helper_method :current_user

  def current_user
    @current_user = Minitest::Mock.new
  end

end
