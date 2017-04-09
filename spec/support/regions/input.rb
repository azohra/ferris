class Input < Ferris::Region
  element(:text) { root.text_field(id: 'input__text') }
  element(:password) { root.text_field(id: 'input__password') }
  element(:url) { root.text_field(id: 'input__webaddress') }
  element(:email)  { root.text_field(id: 'input__emailaddress') }
  element(:phone)  { root.text_field(id: 'input__emailaddress') }
  element(:search)  { root.text_field(id: 'input__search') }
  element(:number)  { root.text_field(id: 'input__text2') }
  element(:error)  { root.text_field(id: 'input__text3') }
  element(:valid)  { root.text_field(id: 'input__text4') }
end
