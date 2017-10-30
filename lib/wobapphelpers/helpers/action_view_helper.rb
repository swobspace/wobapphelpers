module Wobapphelpers
  module Helpers

    # implement model independent links for new, edit, show, delete
    module ActionViewHelper
      include Wobapphelpers::Breadcrumbs::BreadcrumbsHelper

      def form_legend
        raw(
         %Q[<div class="row">] +
         %Q[<div class="col-sm-9 col-sm-offset-3 col-md-offset-2 col-md-offset-2">] +
         %Q[<legend>#{controlleraction}</legend>] +
         %Q[</div>] +
         %Q[</div>]
        )
      end

      def new_link(poly, options = {})
        mypoly, obj = get_object(poly)
        if _can?(:create, obj)
          options.symbolize_keys!
          link_to obj.model_name.human + " erstellen",
            new_polymorphic_path(mypoly),
            remote: options.fetch(:remote, false),
            title: options.fetch(:title, title(obj) + " hinzufügen"),
            class: options.fetch(:class, 'btn btn-secondary')
        end
      end

      def show_link(poly, options = {})
        mypoly, obj = get_object(poly)
        if _can?(:read, obj)
          options.symbolize_keys!
          link_to icon_show, polymorphic_path(mypoly),
            remote: options.fetch(:remote, false),
            title:  options.fetch(:title, title(obj) + " anzeigen"),
            class:  options.fetch(:class, 'btn btn-secondary')
        end
      end

      def edit_link(poly, options = {})
        mypoly, obj = get_object(poly)
        if _can?(:edit, obj)
          options.symbolize_keys!
          link_to icon_edit, edit_polymorphic_path(mypoly),
            remote: options.fetch(:remote, false),
            title:  options.fetch(:title, title(obj) + " bearbeiten"),
            class:  options.fetch(:class, 'btn btn-secondary')
        end
      end

      def delete_link(poly, options = {})
        mypoly, obj = get_object(poly)
        if _can?(:destroy, obj)
          options.symbolize_keys!
          verify = options.has_key?(:verify) ? { verify: options.fetch(:verify) } : {}
          link_to icon_delete, mypoly,
            remote: options.fetch(:remote, false),
            data: {
              confirm: options.fetch(:confirm, "Sie wollen das Objekt löschen.\nSind Sie sicher?")
            }.merge(verify),
            method: :delete,
            title:  options.fetch(:title, title(obj) + " löschen"),
            class:  options.fetch(:class, 'btn btn-danger')
        end
      end

      def back_link(options = {})
        options.symbolize_keys!
	unless options[:path].nil?
	  goto = options[:path]
	else
          label = icon_left + " " + t('wobapphelpers.helpers.back')
	  if session[:breadcrumbs] && session[:breadcrumbs].size > 1
	    bc = session[:breadcrumbs][-2]
	    idx   =  session[:breadcrumbs].size - 2
	    title = bc[0]
	    goto  = bc[1]
	    breadcrumb_idx(label, goto, idx, 'btn btn-secondary')
	  else
	    link_to label, url_for(:back), :class => 'btn btn-secondary'
	  end
        end
      end

      def cancel_button
        link_to icon_cancel + " " + t('wobapphelpers.helpers.cancel'),
          url_for(:back), :class => 'btn btn-secondary'
      end

      def show_flash
        # "- #{flash[:success]} - #{flash[:notice]} - #{flash[:alert]} -"
	msg = ""
	[:alert, :error, :notice, :success, :info].each do |severity|
	  next unless flash[severity]
	  case severity
	  when :error, :alert
	    my_class = "alert alert-danger"
	  when :notice, :info
	    my_class = "alert alert-info"
	  when :success
	    my_class = "alert alert-success"
	  else
	    my_class = severity.to_s
	  end
	  msg += %Q[<div id="#{severity.to_s}" class="#{my_class} alert-dismissable fade in noprint">]
	  msg += %Q[<button class="close" data-dismiss="alert" aria-hidden="true">&times;</button>]
	  msg += flash[severity]
	  msg += %Q[</div>]
	end
	msg.html_safe
      end

      def active_class(myclass)
        if controller.controller_name == myclass
          "active"
        end
      end

      private

      #
      # returns poly, object
      # mypoly: poly.compact! if is_a? Array
      #
      def get_object(poly)
        mypoly = poly
	if mypoly.kind_of? Array
          mypoly.compact!
	  return mypoly, mypoly[-1]
        else
          return mypoly, mypoly
        end
      end

      def title(obj)
        if obj.kind_of? Class
          model = obj
        else
          model = obj.class
        end
        t('activerecord.models.' + model.model_name.i18n_key.to_s)
      end

      def controlleraction
        action        = controller.action_name
        namespace     = controller.controller_path
        resource_name = t("activerecord.models.#{namespace.singularize}")
        search_for    = [namespace, action].join(".").to_sym
        t(search_for, scope: "wobapphelpers.controller".to_sym,
          default: action.to_sym, name: resource_name)
      end

      def _can?(action, obj)
        return true if Wobapphelpers.cancan == :none
        obj = _normalize(obj) if obj.kind_of? Class
        can? action, obj
      end

      def _normalize(model)
        if Wobapphelpers.cancan == :cancan2
          model.model_name.downcase.pluralize.to_sym
        else
          model
        end
      end
    end
  end
end
