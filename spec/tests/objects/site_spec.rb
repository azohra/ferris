require_relative '../../spec_helper'

describe Ferris::Site do
  before(:all) do
    @website = Website.new(:local, url: BASE_URL)
  end

  after(:all) do
    @website.close
  end

  it 'is the correct object type' do
    expect(@website).to be_a Ferris::Site
  end

  it 'responds to url' do
    expect(@website).to respond_to :url
  end

  it 'can retrieve its url' do
    expect( @website.url).to eql BASE_URL
  end
end
