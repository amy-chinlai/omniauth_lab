class Category < ApplicationRecord
    has_many :requests

    validates :name, presence: true

    CATEGORIES = [
    "Letter Campaigns", 
    "Petitions",
    "User Interface"
    ]
end
