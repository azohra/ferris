require 'watir'
require 'ferris/core'
require 'ferris/concepts'
require 'ferris/site'
require 'ferris/page'
require 'ferris/region'

module Ferris
  class << self
    attr_accessor :browser, :headless_driver, :custom, :base_url
  end
end
