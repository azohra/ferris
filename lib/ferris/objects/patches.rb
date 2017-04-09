module Watir
  class Element
    def do(v)
      case self
      when Watir::Radio
        set if v
      when Watir::CheckBox
        v ? set : clear
      when Watir::Select
        select v
      when Watir::TextField, Watir::TextArea, Watir::Input
        set v
      else
        click
      end
    end

    def do!(v)
      case self
      when Watir::CheckBox, Watir::Radio
        browser.execute_script("arguments[0].checked = #{v ? 'true' : 'false'};", self)
      when Watir::Select
        browser.execute_script("arguments[0].val('#{v}');", self)
      when Watir::TextField, Watir::TextArea, Watir::Input
        browser.execute_script("arguments[0].value = '#{v}';", self)
      else
        browser.execute_script('arguments[0].click();', self)
      end
    end
  end
end
