module Ferris
  class Page < Ferris::Core

  attr_reader :page_url

  extend Ferris::Concepts::Regions
  extend Ferris::Concepts::Elements
  extend Ferris::Concepts::PageAttributes

  def initialize
    super
    @page_url = Ferris.base_url + partial_url
  end

  def visit
    browser.goto @page_url
    self
  end

  end
end
