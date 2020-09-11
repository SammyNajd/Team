class User < ApplicationRecord
    validates :first_name, :last_name, :role, presence: true

    has_many :tasks

    scope :active, -> {where(active: true)}


    def get_full_name
        "#{last_name}, #{first_name}"
    end

end
