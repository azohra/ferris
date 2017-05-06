module Ferris
  module Concepts
    module FormFilling
      def fill(data)
        data.to_hash.each { |k, v| send(k).do(v) }
        browser.send_keys :tab
      end

      def fill!(data)
        data.to_hash.each { |k, v| send(k).do!(v) }
        browser.send_keys :tab
      end
    end
  end
end
