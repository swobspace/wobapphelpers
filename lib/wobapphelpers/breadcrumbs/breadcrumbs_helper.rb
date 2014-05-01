module Wobapphelpers
  module Breadcrumbs
    module BreadcrumbsHelper
      def render_breadcrumbs
	return if Wobapphelpers.breadcrumb_controller_blacklist.include?(controller.controller_path)
	return if session[:breadcrumbs].nil? || session[:breadcrumbs].size == 0
	track = ""
	session[:breadcrumbs].each_with_index do |b, idx|
	  track += "&gt; #{breadcrumb_idx(b[0], b[1], idx)} "
	end
	%Q[<div id="breadcrumbs" class="visible-desktop">#{track}</div>].html_safe
      end

      def breadcrumb_idx(name, url, idx, html_class=nil)
        uri = URI.parse(url)
        query = uri.query || ""
        if query =~ /bci=(\d+)/
          uri.query.gsub!(/bci=(\d+)/, "bci=#{idx}")
        else
          uri.query = query + "&bci=#{idx}"
        end
        link_to name, uri.to_s.gsub('?&','?'), :class => html_class
      end
    end
  end
end
