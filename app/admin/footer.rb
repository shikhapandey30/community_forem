module ActiveAdmin
  module Views
    class Footer < Component
      def build
        super id: "footer"

        div do
          small "Powered by Flexsin #{Date.today.year}"
        end
      end
    end
  end
end