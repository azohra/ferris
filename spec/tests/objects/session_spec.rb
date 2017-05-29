require_relative '../../spec_helper'

describe 'Ferris Session' do
  context 'Local' do

    before(:all) do
     @local_session= Ferris::Session::Local.new
    end
    
    it 'is the correct object type' do
      expect(@local_session).to be_a Ferris::Session::Local
    end
    
    it 'responds to attr browser' do
      expect(@local_session).to respond_to :browser
    end 

    it 'responds to attr width' do
      expect(@local_session).to respond_to :width
    end  
 
    it 'responds to attr height' do
      expect(@local_session).to respond_to :height
    end      
  
    it 'responds to method maximize' do
      expect(@local_session).to respond_to :maximize
    end     

    it 'responds to method size=' do
      expect(@local_session).to respond_to :size=
    end    

    it 'responds to method size=' do
      expect(@local_session).to respond_to :size=
    end    

    it 'responds to clear_cookies' do
     expect(@local_session).to respond_to :clear_cookies
    end 
  end

  context 'Remote' do
    
    before(:all) do
      system('docker run -d -p 4444:4444 --name selenium-hub selenium/hub:3.4.0-chromium')
      system('docker run --name chrome -d --link selenium-hub:hub selenium/node-chrome:3.4.0-chromium')
      sleep(5) #let docker containers startup       
     @remote_session= Ferris::Session::Remote.new(browser: 'chrome')
    end
    
    after(:all) do 
      system('docker stop selenium-hub')
      system('docker stop chrome')
      system('docker rm selenium-hub')
      system('docker rm chrome')   
    end
    
    it 'is the correct object type' do
      expect(@remote_session).to be_a Ferris::Session::Remote
    end
    
    it 'responds to attr browser' do
      expect(@remote_session).to respond_to :browser
    end 

    it 'responds to attr width' do
      expect(@remote_session).to respond_to :width
    end  
 
    it 'responds to attr height' do
      expect(@remote_session).to respond_to :height
    end      
  
    it 'responds to method maximize' do
      expect(@remote_session).to respond_to :maximize
    end     

    it 'responds to method size=' do
      expect(@remote_session).to respond_to :size=
    end    

    it 'responds to method size=' do
      expect(@remote_session).to respond_to :size=
    end    

    it 'responds to clear_cookies' do
     expect(@remote_session).to respond_to :clear_cookies
    end 
  end  
end
