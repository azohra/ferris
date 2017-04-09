require 'spec_helper'
require 'benchmark'

describe Ferris::Core do
  let(:site) { TestSite.new }
  let(:input_region_fields) { Inputs.new }

  it 'do' do
    site.home_page.visit
    site.home_page.input.do(input_region_fields)
    expect(site.home_page.input.text.value).to eql 'Apple'
  end

  it 'do!' do
    site.home_page.visit
    site.home_page.input.do!(input_region_fields)
    expect(site.home_page.input.text.value).to eql 'Apple'
  end

  it 'do! better than do' do
    site.home_page.visit
    watir = Benchmark.measure { site.home_page.input.do(input_region_fields) }
    site.home_page.visit
    ferris = Benchmark.measure { site.home_page.input.do!(input_region_fields) }
    puts "Result: #{ferris.real} vs #{watir.real}"
    expect(ferris.real).to be < watir.real
  end

end
