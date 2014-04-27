module Wobapphelpers
  autoload :Helpers, 'wobapphelpers/helpers'
  autoload :Responders, 'wobapphelpers/responders'
  autoload :Breadcrumbs, 'wobapphelpers/breadcrumbs'

  def self.setup
    yield self
  end


  # Use cancan abilities to decide if action links should be presented. 
  # Defaults to :none
  #
  mattr_reader :cancan 
  @@cancan = :none

  # Which variant of cancan should be used? possible values are:
  #   * +:none+: no usage of Cancan or Cancancan
  #   * +:cancan1+: cancan '~> 1.6.0' or cancancan '~> 1.7.0'
  #   * +:cancan2+: cancan '~> 2.0.0'
  #
  def self.cancan=(variant)
    if [:none, :cancan1, :cancan2].include?(variant)
      @@cancan = variant
    else
      raise "Cancan variant #{variant} not implemented!"
    end
  end
end
