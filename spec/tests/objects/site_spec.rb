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

     it 'responds to attr sa' do
      expect(@local_website).to respond_to :sa
    end   

    it 'responds to attr url' do
      expect(@local_website).to respond_to :url
    end

    it 'responds to attr b' do
      expect(@local_website).to respond_to :b
    end    

    it 'responds to attr width' do
      expect(@local_website).to respond_to :width
    end  
 
    it 'responds to attr height' do
      expect(@local_website).to respond_to :height
    end      
  
    it 'responds to method maximize' do
      expect(@local_website).to respond_to :maximize
    end     

    it 'responds to method resize_to' do
      expect(@local_website).to respond_to :resize_to
    end    

    it 'responds to clear_cookies' do
     expect(@local_website).to respond_to :clear_cookies
    end 

    it 'site_args is a hash' do
      expect(@local_website.sa).to be_a Hash
    end

     it 'can change size' do
      expect(@local_website.resize_to(width: 1020, height: 1024)).to be nil
    end 

     it 'can clear cookies' do
      expect(@local_website.clear_cookies).to be nil 
    end 

    it 'can retrieve its url' do
      expect( @local_website.url).to eql BASE_URL
    end
  end

  context 'Remote' do 
    before(:all) do
      system('docker run -d -p 4444:4444 --name selenium-hub selenium/hub:3.4.0-chromium')
      system('docker run --name chrome -d --link selenium-hub:hub selenium/node-chrome:3.4.0-chromium')
      sleep(5)
      @remote_website = Website.new(:remote, browser: 'chrome', url: BASE_URL)
    end

    after(:all) do
      @remote_website.close
      system('docker stop selenium-hub chrome')
      system('docker rm selenium-hub chrome')
    end

    it 'is the correct object type' do
      expect(@remote_website).to be_a Ferris::Site
    end

    it 'responds to attr sa' do
      expect(@remote_website).to respond_to :sa
    end

    it 'responds to attr url' do
      expect(@remote_website).to respond_to :url
    end

    it 'responds to attr b' do
      expect(@remote_website).to respond_to :b
    end      

    it 'responds to attr width' do
      expect(@remote_website).to respond_to :width
    end  
 
    it 'responds to attr height' do
      expect(@remote_website).to respond_to :height
    end      
  
    it 'responds to method maximize' do
      expect(@remote_website).to respond_to :maximize
    end     

    it 'responds to method resize_to' do
      expect(@remote_website).to respond_to :resize_to
    end    

    it 'responds to clear_cookies' do
     expect(@remote_website).to respond_to :clear_cookies
    end 

    it 'site_args is a hash' do
      expect(@remote_website.sa).to be_a Hash
    end

     it 'can change size' do
      expect(@remote_website.resize_to(width: 1020, height: 1024)).to be nil
    end 

     it 'can clear cookies' do
      expect(@remote_website.clear_cookies).to be nil 
    end 

    it 'can retrieve its url' do
      expect( @remote_website.url).to eql BASE_URL
    end
  end
end
