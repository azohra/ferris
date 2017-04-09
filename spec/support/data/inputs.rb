# encoding: utf-8
class Inputs < WatirModel
  key(:text) { 'Apple' }
  key(:password) { 'MyPassword123#!' }
  key(:url) { 'http://www.google.ca' }
  key(:email) { 'ferris@bueller.ca' }
  key(:phone) { '4165555555' }
  key(:search) { 'Apples' }
  key(:number) { '10564' }
  key(:error) { 'Error!' }
  key(:valid) { 'Valid!' }
end
