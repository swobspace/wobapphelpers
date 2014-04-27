module Wobapphelpers
  module Breadcrumbs
    module ActionController
      def add_breadcrumb(name, url)
        breadcrumbs ||= (session[:breadcrumbs] || [] )
        if params[:bci]
          # this a back link of an existing breadcrumb entry,
          # shorten the list
          breadcrumbs = breadcrumbs.first(params[:bci].to_i)
        end
        if breadcrumbs.size == 0 || url != breadcrumbs.last[1]
          breadcrumbs << [name, url]
        end
        session[:breadcrumbs] = breadcrumbs.last(6)
      end

      def last_breadcrumb
	session[:breadcrumbs].last || [nil, :back]
      end

      def last_breadcrumb_url
	last_breadcrumb[1]
      end

      def add_breadcrumb_index
	return if request.format == :json
	text = t("controller.#{controller_name}")
	url  = request.fullpath
	add_breadcrumb(text, url)
      end

    end
  end
end
