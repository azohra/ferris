require 'watir'

require_relative 'ferris/concepts/elements'
require_relative 'ferris/concepts/page_attributes'
require_relative 'ferris/concepts/pages'
require_relative 'ferris/concepts/regions'

require_relative 'ferris/objects/core'
require_relative 'ferris/objects/site'
require_relative 'ferris/objects/page'
require_relative 'ferris/objects/region'
require_relative 'ferris/objects/patches'

module Ferris
  class << self
    attr_accessor :browser, :headless_driver, :custom, :base_url
  end
end
