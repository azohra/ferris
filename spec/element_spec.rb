require 'spec_helper'

describe 'Ferris Elements' do
  let(:site) { TestSite.new }

  it 'keyword' do
    expect(site.home_page.input.text.keyword).to eq(:text)
  end

  it 'do' do
    site.home_page.visit
    site.home_page.input.text.do 'Apple'
    expect(site.home_page.input.text.value).to eql 'Apple'
  end

  it 'do!' do
    site.home_page.visit
    site.home_page.input.text.do! 'Apple'
    expect(site.home_page.input.text.value).to eql 'Apple'
  end
end
