require_relative '../../spec_helper'

describe 'Monkey Patches' do

  before(:all) do
    @website = Website.new(:local, url: BASE_URL)
  end

  after(:all) do
    @website.close
  end
  
  context 'Watir Elements' do
    it 'can call do' do
      expect(@website.elements_page.text_field).to respond_to :do
    end

    it 'can call do!' do
      expect(@website.elements_page.text_field).to respond_to :do!
    end

  end

end
