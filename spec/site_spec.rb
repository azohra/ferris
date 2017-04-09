require 'spec_helper'

describe 'Ferris' do
  let(:wiki) { Wikipedia.new }

  context 'Page' do
    it 'visit' do
      wiki.home_page.visit
      expect(wiki.header.present?).to be_truthy
    end

    it 'title' do
      expect(wiki.home_page.title).to eql 'Wikipedia, the free encyclopedia'
    end

    it 'url' do
      expect(wiki.home_page.url).to eql 'https://en.wikipedia.org/wiki/Main_Page'
    end

    it 'do' do
      wiki.home_page.visit
      wiki.header.do(search_term: 'Apple')
      expect(wiki.header.search_term.value).to eql 'Apple'
    end

    it 'do!' do
      wiki.home_page.visit
      wiki.header.do!(search_term: 'Apple')
      expect(wiki.header.search_term.value).to eql 'Apple'
    end
  end

  context 'Region' do
    it 'exists?' do
      expect(wiki.header).to respond_to(:exists?)
    end

    it 'present?' do
      expect(wiki.header).to respond_to(:present?)
    end

    it 'click' do
      expect(wiki.header).not_to respond_to(:click)
    end
  end

  context 'Element' do
    it 'keyword' do
      expect(wiki.header.search_term.keyword).to eq(:search_term)
    end

    it 'do' do
      wiki.home_page.visit
      wiki.header.search_term.do 'Apple'
      expect(wiki.header.search_term.value).to eql 'Apple'
    end

    it 'do!' do
      wiki.home_page.visit
      wiki.header.search_term.do! 'Apple'
      expect(wiki.header.search_term.value).to eql 'Apple'
    end
  end
end
