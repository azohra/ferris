require 'spec_helper'

describe Ferris::Page do
  let(:site) { TestSite.new }
  let(:input_region_fields) { Inputs.new }

  it 'type' do
    expect(site.home_page).to be_a Ferris::Page
  end

  it 'visit' do
    expect(site.home_page.visit).to be_a Ferris::Page
  end

  it 'title' do
    expect(site.home_page.title).to eql 'HTML5 Test Page'
  end

  it 'url' do
    expect(site.home_page.url).to eql "file://#{ENV['PWD']}/spec/index.html"
  end

end
