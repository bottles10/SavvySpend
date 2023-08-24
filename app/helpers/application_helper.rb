module ApplicationHelper
    def progress_bar_color_class(percentage)
        if percentage <= 40
          "bg-danger"
        elsif percentage <= 75
          "bg-warning"
        else
          "bg-success"
        end
      end
end
