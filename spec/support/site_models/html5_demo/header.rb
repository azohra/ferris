class Header < Ferris::Region
  element(:title) { root.h1 }
  element(:tagline) { root.p }
end
