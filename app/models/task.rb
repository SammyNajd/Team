class Task < ApplicationRecord
    belongs_to :user, optional: true
    validates :user_id, :start_date, :subject, :description, :priority, :status, presence: true 

    enum priority_levels: {
        "Very Low" => 1,
        "Low" => 2,
        "Medium" => 3,
        "High" => 4,
        "Severe" => 5
    }

    enum status_levels: {
        "Planned" => "Planned",
        "In Progress" => "In Progress",
        "Completed" => "Completed"
    }

end
