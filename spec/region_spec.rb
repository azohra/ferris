require 'spec_helper'

describe Ferris::Region do
  let(:site) { TestSite.new }

  it 'is the correct object type' do
    expect(site.header).to be_a Ferris::Region
  end

  it 'can call exists?' do
    expect(site.header).to respond_to(:exists?)
  end

  it 'can call present?' do
    expect(site.header).to respond_to(:present?)
  end

  it 'cannot call click' do
    expect(site.header).not_to respond_to(:click)
  end
end
