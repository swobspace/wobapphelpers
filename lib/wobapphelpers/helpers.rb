module Wobapphelpers
  module Helpers
    autoload :IconHelper, 'wobapphelpers/helpers/icon_helper.rb'
    autoload :ActionViewHelper, 'wobapphelpers/helpers/action_view_helper.rb'
    autoload :PolymorphicHelper, 'wobapphelpers/helpers/polymorphic_helper.rb'

    # one module to rule all
    module All
      include IconHelper
      include ActionViewHelper
      # PolymorphicHelper must be explicit included
    end
  end
end
