require_relative '../../spec_helper'
require 'benchmark'

describe 'Ferris Element' do

  before(:all) do
    @website = Website.new(:local, url: BASE_URL)
  end

  after(:all) do
    @website.close
  end

  it 'responds to keyword' do
    expect(@website.elements_page.text_field).to respond_to :keyword
  end

  it 'can retrieve its keyword' do
    expect(@website.elements_page.text_field.keyword).to eq(:text_field)
  end

  it 'is retrievable from a region' do
    expect(@website.header.title).to be_a Watir::Element
  end

  it 'is retrievable from a page' do
    expect(@website.elements_page.text_field).to be_a Watir::Element
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
