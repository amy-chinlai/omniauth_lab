class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(email: params[:session][:email].downcase) 
        if user && user.authenticate(params[:session][:password])
            log_in(user)
            redirect_to requests_path
        else
            redirect_to '/login', alert: "Your username and password combination is invalid!"
        end
    end

    def create_from_facebook
        puts "env key below"
        puts ENV['FACEBOOK_KEY']
        puts ENV['FACEBOOK_SECRET']
        puts "auth below"
        puts auth || "nothing here"
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
            u.name = auth['info']['name']
            u.email = auth['info']['email']
            u.image = auth['info']['image']
          end
      
          session[:user_id] = @user.id
      
          redirect_to requests_path
    end

    # def omniauth
    #     @user = User.find_or_create_by(username: auth[:info][:email]) do |u|
    #         u.email = auth[:info][:email]
    #         u.name = auth[:info][:name]
    #         u.uid = auth[:uid]
    #     end

    #     if @user.valid?
    #         session[:user_id] = @user.id
    #         redirect_to requests_path
    #     else
    #         flash[:message] = "Credentials Error"
    #     end
    # end

    def destroy
        log_out
        redirect_to '/signup', alert: "You are now logged out!"
    end

    private

    def auth
      request.env['omniauth.auth']
      puts "requested auth!"
      puts request.env['omniauth.auth']
      request.env['omniauth.auth']
    end

end