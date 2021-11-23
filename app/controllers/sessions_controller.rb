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
        # @user = User.find_or_create_by(uid: auth['uid']) do |u|
        #     u.name = auth['info']['name']
        #     u.email = auth['info']['email']
        #     u.image = auth['info']['image']
        # end

        @user = User.find_or_create_by(uid: auth['uid'])
        @user.name = auth['info']['name']
        @user.email = auth['info']['email']
        @user.image = auth['info']['image']
        puts @user.attributes
        @user.save!
        puts @user.attributes
      
        log_in(@user)
        puts "session below"
        puts session[:user_id]
      
        redirect_to requests_path
    end

    def destroy
        log_out
        redirect_to '/signup', alert: "You are now logged out!"
    end

    private

    def auth
        puts request.env['omniauth.auth']
      request.env['omniauth.auth']
    end

end