module Wobapphelpers
  module Helpers

    # implement model independent links for new, edit, show, delete
    module ActionViewHelper

      def new_link(model, options = {})
        link_to model.model_name.human + " erstellen",
          url_for(options.merge(:action => 'new')),
          title: options.fetch('title', title(model) + " hinzufügen"),
          class: options.fetch('css', 'btn btn-default')
      end

      def show_link(poly, options = {})
        parent, obj = nesting_stuff(poly)
        link_to icon_show, polymorphic_path(poly), 
          remote: options.fetch('remote', false),
          title:  options.fetch('title', title(obj) + " anzeigen"),
          class:  options.fetch('css', 'btn btn-default')
      end

      def edit_link(poly, options = {})
        parent, obj = nesting_stuff(poly)
        link_to icon_edit, edit_polymorphic_path(poly), 
          remote: options.fetch('remote', false),
          title:  options.fetch('title', title(obj) + " bearbeiten"),
          class:  options.fetch('css', 'btn btn-default')
      end

      def delete_link(poly, options = {})
        parent, obj = nesting_stuff(poly)
        link_to icon_delete, poly, 
          remote: options.fetch('remote', false),
          data: { confirm: "Sie wollen das Objekt löschen.\nSind Sie sicher?" }, 
          method: :delete,
          title:  options.fetch('title', title(obj) + " bearbeiten"),
          class:  options.fetch('css', 'btn btn-danger')
      end

      def cancel_button
        link_to icon_cancel + " " + t('helpers.cancel'), 
          url_for(:back), :class => 'btn btn-default'
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

    end
  end
end
