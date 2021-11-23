class Vote < ApplicationRecord
    belongs_to :user
    belongs_to :request

    # belongs_to :user, required: true
    # belongs_to :request, required: true

    validates :vote_type,  {
        presence: true,
        :inclusion => -1..1
        }   
    validates :user_id, presence: true
    validates :request_id, presence: true
end
