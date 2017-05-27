require_relative '../../spec_helper'

describe 'Monkey Patches' do

  before(:all) do
    @website = Website.new(url: BASE_URL)
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
