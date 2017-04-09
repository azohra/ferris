require 'spec_helper'

describe 'Wikipedia' do
  let(:wiki) {Wikipedia.new}

  it 'can visit a page' do
    wiki.home_page.visit
    expect(wiki.header.present?).to be_truthy
  end

  it 'can verify a page title' do
    wiki.home_page.visit
    expect(wiki.home_page.page_title).to eql Ferris.browser.title
  end

  it 'can verify a page url' do
    wiki.home_page.visit
    expect(wiki.home_page.page_url).to eql Ferris.browser.url
  end

  it 'can search' do
    wiki.home_page.visit
    wiki.header.search('Apple')
    expect(wiki.apple_page.page_title).to eql Ferris.browser.title
  end

  it 'can check a region exists' do
    wiki.home_page.visit
    expect(wiki.header.exists?).to be_truthy
  end

  it 'can check a region is present' do
    wiki.home_page.visit
    expect(wiki.header.present?).to be_truthy
  end


  it 'can check an elements keyword' do
    expect(wiki.apple_page.article_heading.keyword).to eq(:article_heading)
  end

end
