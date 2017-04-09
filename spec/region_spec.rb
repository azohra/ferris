require 'spec_helper'

describe Ferris::Region do
  let(:site) { TestSite.new }

  it 'exists?' do
    expect(site.home_page.input).to respond_to(:exists?)
  end

  it 'present?' do
    expect(site.home_page.input).to respond_to(:present?)
  end

  it 'click' do
    expect(site.home_page.input).not_to respond_to(:click)
  end
end
