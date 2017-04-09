require 'spec_helper'

describe 'Ferris Elements' do
  let(:site) { TestSite.new }

  it 'can call keyword' do
    expect(site.home_page.text_field.keyword).to eq(:text_field)
  end

  it 'can call do' do
    site.home_page.visit
    site.home_page.text_field.do 'Apple'
    expect(site.home_page.text_field.value).to eql 'Apple'
  end

  it 'can call do!' do
    site.home_page.visit
    site.home_page.text_field.do! 'Apple'
    expect(site.home_page.text_field.value).to eql 'Apple'
  end

  it 'can locate from a region' do
    expect(site.header.title).to be_a Watir::Element
  end

  it 'can locate from a page' do
    expect(site.home_page.text_field).to be_a Watir::Element
  end
end
