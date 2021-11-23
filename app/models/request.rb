class Request < ApplicationRecord
    has_many :votes
    has_many :users, through: :votes
    belongs_to :creator, class_name: "User", required: true
    belongs_to :category, required: true

    validates :name, {
        uniqueness: true,
        presence: true
    }
    
    validates :category_id, presence: true

    def total_votes
        Vote.where(request_id: id).sum(:vote_type)
    end
end
