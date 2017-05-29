require_relative '../../spec_helper'
require 'benchmark'

describe 'Ferris' do

  before(:all) do
    @website = Website.new(:local, url: BASE_URL)
    @region = @website.header
  end

  after(:all) do
    @website.close
  end
  
  context 'Region' do 
    it 'is the correct object type' do
      expect(@region).to be_a Ferris::Region
    end

    it 'responds to attr sa' do
      expect(@region).to respond_to :sa
    end    

    it 'responds to attr r' do
      expect(@region).to respond_to :r
    end    

    it 'responds to exists?' do
      expect(@region).to respond_to :exists?
    end

    it 'responds to present?' do
      expect(@region).to respond_to :present?
    end

    it 'does not respond to click' do
      expect(@region).not_to respond_to :click
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

    it 'responds to attr sa' do
      expect(@regions.first).to respond_to :sa
    end    

    it 'responds to attr r' do
      expect(@regions.first).to respond_to :r
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

  end

end
