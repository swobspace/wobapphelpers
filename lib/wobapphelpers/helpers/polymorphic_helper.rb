module Wobapphelpers
  module Helpers
    module PolymorphicHelper
      def polymorphic_selector(form, poly, types, group_method = :all, options = {})
        msg = ""
        # -- object available?
        if form.object.send(poly).present?
          msg += poly_type_display(form, poly)
          msg += poly_id_select(form, poly, form.object.send("#{poly}_type"), :all, options)
        elsif types.size == 1
          msg += poly_type_display(form, poly, Array(types).first)
          msg += poly_id_select(form, poly, Array(types).first, :all, options)
        else
          msg += poly_type_select(form, poly, types)
          msg += poly_id_select(form, poly, types, group_method, options)
        end
        msg.html_safe
      end

      private

      def poly_type_select(f, poly, types)
        f.input "#{poly}_type".to_sym, collection: types,
                label_method: lambda {|x| t('activerecord.models.' + x.underscore)}
      end

      def poly_type_display(f, poly, type = nil)
       if type.present?
         f.input("#{poly}_type".to_sym, collection: Array(type), 
           label_method: lambda {|x| t('activerecord.models.' + x.underscore)},
           include_blank: false, disabled: true) +
         f.hidden_field("#{poly}_type".to_sym, value: type, id: "#{poly}_type_hidden")
       else
         f.input("#{poly}_type".to_sym, collection: Array(f.object.send("#{poly}_type")),
           label_method: lambda {|x| t('activerecord.models.' + x.underscore)},
           disabled: true) +
         f.hidden_field("#{poly}_type".to_sym, value: f.object.send("#{poly}_type"), id: "#{poly}_type_hidden")
       end
      end

      def poly_id_select(f, poly, types, group_method, options = {})
        collections = Array(types).map {|t| t.constantize}
        f.input "#{poly}_id".to_sym, collection: collections,
                   as: :grouped_select, group_method: group_method,
                   input_html: options
      end
    end
  end
end
