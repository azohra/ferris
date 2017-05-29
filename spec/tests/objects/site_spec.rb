require_relative '../../spec_helper'

describe Ferris::Site do

  context 'Local' do 
    before(:all) do
      @local_website = Website.new(:local, url: BASE_URL)
    end

    after(:all) do
      @local_website.close
    end

    it 'is the correct object type' do
      expect(@local_website).to be_a Ferris::Site
    end

    it 'responds to url' do
      expect(@local_website).to respond_to :url
    end

    it 'can retrieve its url' do
      expect( @local_website.url).to eql BASE_URL
    end
  end

  context 'Remote' do 
    before(:all) do
      @remote_website = Website.new(:remote, browser: 'chrome', url: BASE_URL)
    end

    after(:all) do
      @remote_website.close
    end

    it 'is the correct object type' do
      expect(@remote_website).to be_a Ferris::Site
    end

    it 'responds to url' do
      expect(@remote_website).to respond_to :url
    end

    it 'can retrieve its url' do
      expect( @remote_website.url).to eql BASE_URL
    end
  end
end
