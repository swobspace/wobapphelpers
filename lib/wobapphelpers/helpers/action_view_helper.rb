module Wobapphelpers
  module Helpers

    # implement model independent links for new, edit, show, delete
    module ActionViewHelper

      def form_legend
        raw(%Q[<legend class="col-sm-9 col-sm-offset-3">#{controlleraction}</legend>])
      end

      def new_link(model, options = {})
        if _can?(:create, model)
          link_to model.model_name.human + " erstellen",
            url_for(options.merge(:action => 'new')),
            title: options.fetch('title', title(model) + " hinzufügen"),
            class: options.fetch('css', 'btn btn-default')
        end
      end

      def show_link(poly, options = {})
        parent, obj = nesting_stuff(poly)
        if _can?(:read, obj)
          link_to icon_show, polymorphic_path(poly), 
            remote: options.fetch('remote', false),
            title:  options.fetch('title', title(obj) + " anzeigen"),
            class:  options.fetch('css', 'btn btn-default')
        end
      end

      def edit_link(poly, options = {})
        parent, obj = nesting_stuff(poly)
        if _can?(:edit, obj)
          link_to icon_edit, edit_polymorphic_path(poly), 
            remote: options.fetch('remote', false),
            title:  options.fetch('title', title(obj) + " bearbeiten"),
            class:  options.fetch('css', 'btn btn-default')
        end
      end

      def delete_link(poly, options = {})
        parent, obj = nesting_stuff(poly)
        if _can?(:destroy, obj)
          link_to icon_delete, poly, 
            remote: options.fetch('remote', false),
            data: { confirm: "Sie wollen das Objekt löschen.\nSind Sie sicher?" }, 
            method: :delete,
            title:  options.fetch('title', title(obj) + " löschen"),
            class:  options.fetch('css', 'btn btn-danger')
        end
      end

      def back_link
        link_to icon_left + " " + t('wobapphelpers.helpers.back'), 
          url_for(:back), :class => 'btn btn-default'
      end

      def cancel_button
        link_to icon_cancel + " " + t('wobapphelpers.helpers.cancel'), 
          url_for(:back), :class => 'btn btn-default'
      end

      def show_flash
        # "- #{flash[:success]} - #{flash[:notice]} - #{flash[:alert]} -"
	msg = ""
	[:alert, :error, :notice, :success, :info].each do |severity|
	  next unless flash[severity]
	  case severity
	  when :error, :alert
	    my_class = "alert alert-error"
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

      private

      def nesting_stuff(poly)
	if poly.is_a? Array
	  obj = poly.pop
	else
	  obj = poly
	end
	return poly, obj
      end

      def title(obj)
        if obj.kind_of? Class
          model = obj
        else
          model = obj.class
        end
        t('activerecord.models.' + model.model_name.singular)
      end

      def controlleraction
        t("wobapphelpers.controller.#{controller.action_name}", 
           name: t("activerecord.models.#{controller.controller_name.singularize}"))
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
