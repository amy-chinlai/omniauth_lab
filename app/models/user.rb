class User < ApplicationRecord
    has_many :votes
    has_many :requests, through: :votes
    has_many :requests, foreign_key: :creator_id

    has_secure_password :validations => false


    validates :email, {
        uniqueness: true,
        format: { with: /\A[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\z/, message: "Invalid email"}
    }


    ORGANIZATIONS = [
        "Daily Kos",
        "AFL-CIO",
        "Democratic National Committee",
        "Action Network Staff"
    ]

    def self.from_google(email:, full_name:, uid:, avatar_url:)
        create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
      end

end
