# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users_list = {
    "username1@mail.com" => {
      :password => "password",
      :organization => "Democratic National Committee",
      :admin => true
    },
    "user2@mail.com" => {
      :password => "password",
      :organization => "AFL-CIO",
      :admin => false
    }
  }

  users_list.each do |email, users_hash|
    p = User.new
    p.email = email
    p.password = users_hash[:password]
    p.organization = users_hash[:organization]
    p.admin = users_hash[:admin]
    p.save
  end

  
  categories_list = [
    "Letter Campaigns",
    "User Interface"
]

  categories_list.each do |name|
    p = Category.new
    p.name = name
    p.save
  end

  requests_list = {
    "Make president and vice president built-in targets" => {
      :description => "This will require a lot of work!",
      :category_id => 1,
      :creator_id => 2
    },
    "Add title to letters sent" => {
        :description => "This will not require a ton of work!",
        :category_id => 1,
        :creator_id => 1
    },
    "Change Edit Activist to View Activist" => {
        :description => "This will not require a ton of work! Simple change.",
        :category_id => 2,
        :creator_id => 1
    }
  }

  requests_list.each do |request, request_hash|
    p = Request.new
    p.name = request
    p.description = request_hash[:description]
    p.category_id = request_hash[:category_id]
    p.creator_id = request_hash[:creator_id]
    p.save
  end

  votes_list = {
    1 => {
      :user_id => 1,
      :request_id => 1
    },
    1 => {
      :user_id => 1,
      :request_id => 2
    },
    -1 => {
      :user_id => 1,
      :request_id => 3
    },
    1 => {
      :user_id => 2,
      :request_id => 1
    },
    -1 => {
      :user_id => 2,
      :request_id => 2
    },
    -1 => {
      :user_id => 2,
      :request_id => 3
    }
  }

  votes_list.each do |vote, vote_hash|
    p = Vote.new
    p.vote_type = vote
    p.user_id = vote_hash[:user_id]
    p.request_id = vote_hash[:request_id]
    p.save
  end