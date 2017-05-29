require_relative '../../spec_helper'
require 'benchmark'

describe Ferris::Page do

  before(:all) do
    @website = Website.new(:local, url: BASE_URL)
  end

  after(:all) do
    @website.close
  end

  it 'is the correct object type' do
    expect(@website.elements_page).to be_a Ferris::Page
  end

  it 'responds to visit' do
    expect(@website.elements_page).to respond_to :visit
  end

  it 'responds to title' do
    expect(@website.elements_page).to respond_to :title
  end

  it 'responds to url' do
    expect(@website.elements_page).to respond_to :url
  end

  it 'responds to fill' do
    expect(@website.elements_page).to respond_to :fill    
  end

  it 'responds to fill!' do
    expect(@website.elements_page).to respond_to :fill!    
  end  

  it 'can retrieve its title' do
    expect(@website.elements_page.title).to be_a String
  end

  it 'can retrieve its url' do
    expect(@website.elements_page.url).to be_a String
  end

  it 'caches itself when called with a bang!' do
    expect(@website.elements_page!).to eq(@website.elements_page!)
  end

  it 'caching is faster for a page' do
    not_cached = Benchmark.measure { @website.elements_page }
    cached = Benchmark.measure { @website.elements_page! }
    expect(cached.real).to be < not_cached.real
  end

end
