module Rgn
  class Header < Ferris::Region
    element(:title) { r.h1 }
    element(:tagline) { r.p }
  end
end
