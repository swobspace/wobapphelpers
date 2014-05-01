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
	text = t("controller.#{controller_path}")
	url  = request.fullpath
	add_breadcrumb(text, url)
      end

      def add_breadcrumb_show
        resource = controller_name.singularize
        if instance_variable_defined?("@#{resource}")
          add_breadcrumb_for instance_variable_get("@#{resource}")
        else
          flash[:alert] = "add_breadcrumb_show: instance variable @#{resource} not set; see documentation for Wobapphelpers::Breadcrumbs"
        end
      end

      def add_breadcrumb_for(poly)
	if poly.is_a? Array
	  (parent, child) = poly
	  name  = "#{t('activerecord.models.'+parent.class.name.underscore)}(#{parent.id})/"
	  if child.is_a? Symbol
	    name += "#{t('attributes.'+child.to_s)}"
	  else
	    name += "#{t('activerecord.models.'+child.class.name.underscore)}(#{child.id})"
	  end
	else
	  name = "#{t('activerecord.models.' + poly.class.name.underscore)}(#{poly.id})"
	end
	add_breadcrumb name, polymorphic_path(poly)
      end
    end
  end
end
