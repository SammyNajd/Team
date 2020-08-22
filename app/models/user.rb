class User < ApplicationRecord
    validates :first_name, :last_name, :role, presence: true

    has_many :tasks


end
