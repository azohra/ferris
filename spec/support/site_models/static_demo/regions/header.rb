module StaticDemo
  class Hero < Ferris::Region
    element(:apply_btn) { root.link(class: 'apply') }
    element(:sponsor_btn) { root.link() }




    region(:aisles, AisleTiles) {browser.div(class: 'module-browse-by-aisle container')}
  end
end
