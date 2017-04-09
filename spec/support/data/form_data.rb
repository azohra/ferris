# encoding: utf-8
class FormData < WatirModel
  # Inputs
  key(:text_field) { 'Apple' }
  key(:password) { 'MyPassword123#!' }
  key(:website) { 'http://www.google.ca' }
  key(:email) { 'ferris@bueller.ca' }
  key(:phone) { '4165555555' }
  key(:search) { 'Apples' }
  key(:number) { '10564' }
  key(:error) { 'Error!' }
  key(:valid) { 'Valid!' }


end
