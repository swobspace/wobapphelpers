module Wobapphelpers
  module Helpers
    module IconHelper
      def icon(what)
        raw(%Q[<span class="glyphicon glyphicon-#{what}"></span>])
      end
    end
  end
end
