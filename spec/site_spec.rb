require 'spec_helper'

describe Ferris::Site do
  let(:site) { TestSite.new }

  it 'is the correct object type' do
    expect(site).to be_a Ferris::Site
  end
end
