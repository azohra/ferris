module Ferris
  module Concepts
    module ElementDo

      def do(v)
        case self
          when Watir::Radio
            set if v
          when Watir::CheckBox
            v ? set : clear
          when Watir::Select
            select v
          when Watir::Button
            click
          when Watir::TextField, Watir::TextArea
            set v if v
          else
            click if v
        end
        fire_event :change
      end

      def do!(v)
        case self
          when Watir::Radio
            fire_event :click if set? ^ v
          when Watir::CheckBox
            fire_event :click if checked? ^ v
          when Watir::Select
            browser.execute_script("$(arguments[0]).val('#{v}');", self)
          when Watir::Button
            send_keys :enter
          when Watir::TextField, Watir::TextArea
            clear
            send_keys v
          else
            click
        end
        fire_event :change
      end

    end
  end
end
