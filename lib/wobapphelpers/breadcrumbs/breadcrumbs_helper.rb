module Wobapphelpers
  module Breadcrumbs
    module BreadcrumbsHelper
      def render_breadcrumbs
	return if Wobapphelpers.breadcrumb_controller_blacklist.include?(controller.controller_path)
	return if session[:breadcrumbs].nil? || session[:breadcrumbs].size == 0
	track = ""
	session[:breadcrumbs].each do |b|
	  track += "&gt; #{set_breadcrumb(b[0], b[1])} "
	end
	%Q[<div id="breadcrumbs" class="visible-desktop">#{track}</div>].html_safe
      end

      def set_breadcrumb(name, url, options = {})
        options.symbolize_keys!
        uri = URI.parse(url)
        link_to name, uri.to_s, options
      end
    end
  end
end
