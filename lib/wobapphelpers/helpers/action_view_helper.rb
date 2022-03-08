module Wobapphelpers
  module Helpers

    # implement model independent links for new, edit, show, delete
    module ActionViewHelper
      include Wobapphelpers::Breadcrumbs::BreadcrumbsHelper

      def form_legend
        raw(
         %Q[<div class="row">] +
         %Q[<div class="col-sm-9 offset-sm-3 col-md-10 offset-md-2">] +
         %Q[<legend>#{controlleraction}</legend>] +
         %Q[</div>] +
         %Q[</div>]
        )
      end

      def new_link(poly, options = {})
        mypoly, obj = get_parts(poly)
        if _can?(:create, obj)
          options.symbolize_keys!
          link_to title(obj, :new),
            new_polymorphic_path(mypoly),
              default_options(obj, :new).merge(options)
        end
      end

      def show_link(poly, options = {})
        mypoly, obj = get_parts(poly)
        if _can?(:read, obj)
          options.symbolize_keys!
          link_to icon_show, polymorphic_path(mypoly),
            default_options(obj, :show).merge(options)
        end
      end

      def edit_link(poly, options = {})
        mypoly, obj = get_parts(poly)
        if _can?(:edit, obj)
          options.symbolize_keys!
          link_to icon_edit, edit_polymorphic_path(mypoly),
            default_options(obj, :edit).merge(options)
        end
      end

      def delete_link(poly, options = {})
        mypoly, obj = get_parts(poly)
        if _can?(:destroy, obj)
          options.symbolize_keys!
          options = delete_link_defaults.merge(options)
          options[:title] ||= title(obj, :destroy)
          options[:data][:turbo_confirm] ||= confirm_message(obj)
          link_to icon_delete, mypoly, options
        end
      end

      def delete_button(poly, options = {})
        mypoly, obj = get_parts(poly)
        if _can?(:destroy, obj)
          options.symbolize_keys!
          options = delete_button_defaults.merge(options)
          options[:title] ||= title(obj, :destroy)
          if options[:form].blank?
            options[:form] = Hash.new
          end
          options[:form][:'data-turbo-confirm'] ||= confirm_message(obj)
          button_to mypoly, options do
            icon_delete
          end
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
	    set_breadcrumb(label, goto, class: 'btn btn-secondary me-1')
	  else
	    link_to label, url_for(:back), :class => 'btn btn-secondary me-1'
	  end
        end
      end

      def cancel_button
        link_to icon_cancel + " " + t('wobapphelpers.helpers.cancel'),
          url_for(:back), :class => 'btn btn-secondary me-1'
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
	  msg += %Q[<div id="#{severity.to_s}" class="#{my_class} alert-dismissable fade show noprint" role="alert">]
	  msg += flash[severity]
	  msg += %Q[<button type="button" class="btn-close float-end" data-bs-dismiss="alert" aria-label="Close">]
	  msg += %Q[</button>]
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
      def get_parts(poly)
	if poly.kind_of? Array
          mypoly = poly.compact
	  [mypoly, mypoly[-1]]
        else
          [poly, poly]
        end
      end

      def title(obj, action)
        if obj.kind_of? Class
          model = obj
        else
          model = obj.class
        end
        t(action.to_s, scope: "wobapphelpers.actions".to_sym,
          model: t('activerecord.models.' + model.model_name.i18n_key.to_s))
      end

      def controlleraction
        action        = controller.action_name
        namespace     = controller.controller_path
        resource_name = t("activerecord.models.#{namespace.singularize}")
        search_for    = [namespace, action].join(".").to_sym
        t(search_for, scope: "wobapphelpers.actions".to_sym,
          default: action.to_sym, model: resource_name)
      end

      def _can?(action, obj)
        return true if Wobapphelpers.cancan == :none
        can? action, obj
      end

      def default_options(obj, action)
        {
          title: title(obj, action),
          remote: false,
          class: 'btn btn-secondary me-1',
        }
      end

      def common_delete_defaults
        {
          remote: false,
          class: 'btn btn-danger me-1'
        }
      end

      def delete_link_defaults
        { data: { turbo_method: :delete } }.merge(common_delete_defaults)
      end

      def delete_button_defaults
        { method: :delete }.merge(common_delete_defaults)
      end

      def confirm_message(obj)
       "#{title(obj, :destroy)}?\n" + t('wobapphelpers.actions.destroy_confirm')
      end
    end
  end
end
