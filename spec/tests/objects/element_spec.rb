require_relative '../../spec_helper'
require 'benchmark'

describe 'Ferris' do
  before(:all) do
    @website = Website.new(:local, url: BASE_URL)
  end

  after(:all) do
    @website.close
  end

  context 'Element' do 

    before(:all) do
      @element = @website.elements_page.text_field
    end
    
    it 'responds to keyword' do
      expect(@element).to respond_to :keyword
    end

    it 'can retrieve its keyword' do
      expect(@element.keyword).to eq(:text_field)
    end

    it 'is retrievable from a page' do
      expect(@element).to be_a Watir::Element
    end

    it 'is retrievable from a region' do
      expect(@website.header.title).to be_a Watir::Element
    end

    it 'is retrievable from a site' do
      expect(@website.my_element).to be_a Watir::Element
    end

    it 'caches itself when called with a bang!' do
      expect(@website.my_element!).to eq(@website.my_element!)
    end

    it 'caching is faster for an element' do
      not_cached = Benchmark.measure { @website.my_element }
      cached = Benchmark.measure { @website.my_element! }
      expect(cached.real).to be < not_cached.real
    end
  end

  context 'Elements' do 

     before(:all) do
      @website.visit
      @elements = @website.elements_page.links
    end

    it 'does not respond to keyword' do
      expect(@elements).not_to respond_to :keyword
    end

    it 'knows its size' do
      expect(@elements.size).to eq 53
    end


    it 'caches itself when called with a bang!' do
      expect(@website.elements_page.links!).to eq(@website.elements_page.links!)
    end

    it 'caching is faster for an element' do
      not_cached = Benchmark.measure {@website.elements_page.links }
      cached = Benchmark.measure { @website.elements_page.links! }
      expect(cached.real).to be < not_cached.real
    end
  end
end
