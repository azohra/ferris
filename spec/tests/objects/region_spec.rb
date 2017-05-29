require_relative '../../spec_helper'
require 'benchmark'

describe 'Ferris' do

  before(:all) do
    @website = Website.new(:local, url: BASE_URL)
  end

  after(:all) do
    @website.close
  end
  
  context 'Region' do 
    it 'is the correct object type' do
      expect(@website.header).to be_a Ferris::Region
    end

    it 'responds to exists?' do
      expect(@website.header).to respond_to :exists?
    end

    it 'responds to present?' do
      expect(@website.header).to respond_to :present?
    end

    it 'does not respond to click' do
      expect(@website.header).not_to respond_to :click
    end

    it 'caches itself when called with a bang!' do
      expect(@website.header!).to eq(@website.header!)
    end

    it 'caching is faster for retrieving a region' do
      not_cached = Benchmark.measure { @website.header }
      cached = Benchmark.measure { @website.header! }
      expect(cached.real).to be < not_cached.real
    end

  end
  
  context 'Regions' do 

    before(:all) do 
      @website.visit
      @regions = @website.articles
    end

    it 'is the correct object type' do
      expect(@regions).to be_a Enumerable
    end

    it 'knows its size' do
      expect(@regions.size).to eq 16
    end

    it 'responds to exists?' do
      expect(@regions.first).to respond_to :exists?
    end

    it 'responds to present?' do
      expect(@regions.first).to respond_to :present?
    end

    it 'does not respond to click' do
      expect(@regions.first).not_to respond_to :click
    end

    it 'caches itself when called with a bang!' do
      expect(@website.articles!).to eq(@website.articles!)
    end

    it 'caching is faster for retrieving regions' do
      not_cached = Benchmark.measure { @website.articles }
      cached = Benchmark.measure { @website.articles! }
      expect(cached.real).to be < not_cached.real
    end
  end

end
