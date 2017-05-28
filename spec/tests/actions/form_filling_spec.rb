require_relative '../../spec_helper'
require 'benchmark'

shared_examples 'Form Filling' do |inputs, outputs, lookup|

  before(:all) do
    @website = Website.new(url: BASE_URL)
  end

  let(:data_set) { HTML5DemoFormData.new }
  let(:form_data) { data_set.send(inputs) }
  let(:expected_output) { data_set.send(outputs) }
  let(:found_result) { Hash[form_data.map { |k, _v| [k, @website.elements_page.send(k).send(lookup)] }] }

  it 'accurately populates with fill' do
    @website.elements_page.visit.fill(form_data)
    expect(found_result).to include expected_output
  end

  it 'accurately populates with fill!' do
    @website.elements_page.visit.fill!(form_data)
    expect(found_result).to include expected_output
  end

  it 'fill! is better than fill' do
    @website.elements_page.visit
    watir = Benchmark.measure { @website.elements_page.fill(form_data) }
    @website.elements_page.visit
    ferris = Benchmark.measure { @website.elements_page.fill!(form_data) }
    expect(ferris.real).to be < watir.real
  end

end

describe 'Ferris Actions' do
  #describe('Text') { it_supports 'Form Filling', :text_input, :text_output, :value }
  describe('Select List (Text)') { it_supports 'Form Filling', :select_list_text_input, :select_list_text_output, :value }
  describe('Select Lists (Value)') { it_supports 'Form Filling', :select_list_value_input, :select_list_value_output, :value }
  describe('Checkboxes') { it_supports 'Form Filling', :checkbox_input, :checkbox_output, :checked? }
  describe('Radios') { it_supports 'Form Filling', :radio_input, :radio_output, :set? }
end