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

     it 'can change size' do
      expect(@local_session.size= {width: 1020, height: 1024}).to be_truthy
    end 

     it 'can clear cookies' do
      expect(@local_session.clear_cookies).to be nil 
    end 
  end

  context 'Remote' do
    
    before(:all) do
     @remote_session= Ferris::Session::Remote.new(browser: 'chrome')
    end

    after(:all) do
     @remote_session.close
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

    it 'responds to clear_cookies' do
     expect(@remote_session).to respond_to :clear_cookies
    end 

     it 'can change size' do
      expect(@remote_session.size= {width: 1020, height: 1024}).to be_truthy
    end 

     it 'can clear cookies' do
      expect(@remote_session.clear_cookies).to be nil 
    end     
  end  
end
