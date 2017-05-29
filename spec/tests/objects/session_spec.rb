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
  end

  context 'Remote' do
    
    before(:all) do
     @remote_session= Ferris::Session::Remote.new(browser: 'chrome')
    end

    after(:all) do
     @remote_session.browser.quit
    end    
    
    it 'is the correct object type' do
      expect(@remote_session).to be_a Ferris::Session::Remote
    end
    
    it 'responds to attr browser' do
      expect(@remote_session).to respond_to :browser
    end 
  
  end  
end
