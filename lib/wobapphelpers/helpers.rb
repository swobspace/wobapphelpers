module Wobapphelpers
  module Helpers
    autoload :IconHelper, 'wobapphelpers/helpers/icon_helper.rb'

    # one module to rule all
    module All
      include IconHelper
    end
  end
end
