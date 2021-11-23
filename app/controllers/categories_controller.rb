class CategoriesController < ApplicationController

    before_action :admin?

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        @category.save
        redirect_to categories_path
    end


    def destroy
        @category = Category.find_by(id: params[:id])
        if @category.requests == [] || @category.requests == nil
            @category.destroy
            redirect_to categories_path, alert: "Category has been deleted!"
        else
            redirect_to categories_path, alert: "This category has feature requests, you must delete the feature requests before deleting the category!"
        end
    end

    private
    
    def category_params
        params.require(:category).permit(:name)
    end

end