module ApplicationHelper

    def sorted(column, title)
        direction = sort_direction == "asc" ? "desc": "asc"
        link_to title, :sort_column => column, :direction => direction
    end
end
