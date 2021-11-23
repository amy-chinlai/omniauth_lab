class RequestsController < ApplicationController
    before_action :authenticated?, only: [:my_requests]
    before_action :logged_in?

    def index
        @requests = Request.all
        @category = Category.all
    end

    def show
        @request = Request.find(params[:id])
    end

    def new
        @request = Request.new
    end

    def create
        @request = Request.new(request_params)
        if @request.save
            redirect_to request_path(@request)
        else
            render 'new'
        end
    end

    def edit
        @request = Request.find_by(id: params[:id])
    end

    def update
        @request = Request.find_by(id: params[:id])
        @request.update(request_params)
        redirect_to request_path(@request)
    end

    def destroy
        @request = Request.find_by(id: params[:id])
        @request.destroy
        redirect_to requests_path, alert: "Feature request deleted!"
    end

    def my_requests
        @requests = Request.where(creator_id: current_user.id)
    end


    private

    def request_params
        params.require(:request).permit(:name, :description, :category_id, :creator_id)
    end


end