module Wobapphelpers
  module Helpers
    module IconHelper
      PREDEFINED_ICONS = {
        attachment: 'file',
        back:       'arrow-left',
        calendar:   'calendar',
        cancel:     'trash',
        closed:     'lock',
        copy:       'clone',
        delete:     'trash',
        document:   'file',
        download:   'download',
        edit:       'pencil-alt',
        help:       'question',
        info:       'info',
        left:       'arrow-left',
        new:        'plus',
        ok:         'check',
        open:       'folder-open',
        print:      'print',
        right:      'arrow-right',
        show:       'eye',
        star:       'star',
        up:         'arrow-up',
        link:       'link',
      }
      
      def icon(what)
        raw(%Q[<i class="fas fa-#{what} fa-fw" aria-hidden="true"></i>])
      end

      PREDEFINED_ICONS.each do |key,value| 
        define_method :"icon_#{key}" do
          icon(value)
        end
      end
    end
  end
end
