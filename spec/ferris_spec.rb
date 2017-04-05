require 'spec_helper'

describe 'Wikipedia' do
  it 'can search' do
    home_page.visit
    header.search('Apple')
    expect(Ferris::Config.browser.title).to eql 'Apple - Wikipedia'
  end

  it 'can check a region is present' do
    home_page.visit
    expect(header.present?).to be_truthy
  end

  it 'can check a page is loaded' do
    home_page.visit
    header.search('Apple')
    expect(apple_page.loaded?).to be_truthy
  end

  it 'can check an elements keyword' do
    expect(apple_page.article_heading.keyword).to eq(:article_heading)
  end

  it 'can throw a .loaded? exception' do
    expect { home_page.loaded? }.to raise_error(Ferris::RequirementsException)
  end

  it 'can throw a .present? exception' do
    expect { home_page.present? }.to raise_error(Ferris::RootMissingException)
  end

  context "Page inheritance" do
    it 'Child page includes required elements of his ancestors' do
      expected = [:grand_req, :parent_req, :child_req]
      expect(TestSite::Child.required_element_list).to match(expected)
    end

    it 'Parent page includes required elements of grandparent' do
      expected = [:grand_req, :parent_req]
      expect(TestSite::Parent.required_element_list).to match(expected)
    end

    it 'Page includes its required elements' do
      expect(TestSite::Grandparent.required_element_list).to match([:grand_req])
    end

    it 'Page does not include required elements of its heirs' do
      expect(TestSite::Grandparent.required_element_list).not_to include(:parent_req)
      expect(TestSite::Grandparent.required_element_list).not_to include(:child_req)
    end

    it 'Child page waits for all ancestors required elements to load' do
      expect_any_instance_of(TestSite::Child).to receive_message_chain(:grand_req, :present?) { true }
      expect_any_instance_of(TestSite::Child).to receive_message_chain(:parent_req, :present?) { true }
      expect_any_instance_of(TestSite::Child).to receive_message_chain(:child_req, :present?) { true }

      expect(child_page.visit.loaded?).to be_truthy
    end
  end
end
