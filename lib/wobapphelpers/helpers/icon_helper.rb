module Wobapphelpers
  module Helpers
    module IconHelper
      PREDEFINED_ICONS = {
        attachment: 'file',
        back:       'arrow-left',
        calendar:   'calendar',
        cancel:     'remove',
        closed:     'lock',
        copy:       'edit',
        delete:     'trash',
        document:   'file',
        download:   'download',
        edit:       'pencil',
        help:       'question-sign',
        info:       'info-sign',
        left:       'arrow-left',
        new:        'plus',
        ok:         'ok',
        open:       'folder-open',
        print:      'print',
        right:      'arrow-right',
        show:       'eye-open',
        star:       'star',
        up:         'arrow-up',
      }
      
      def icon(what)
        raw(%Q[<span class="glyphicon glyphicon-#{what}"></span>])
      end

      PREDEFINED_ICONS.each do |key,value| 
        define_method :"icon_#{key}" do
          icon(value)
        end
      end
    end
  end
end
