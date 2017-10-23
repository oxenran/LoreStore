class CategoriesController < ApplicationController
  before_action :confirm_login

    def create
      category = Category.new(name: params[:category_name])
      result = category.save

      if result
        flash[:status] = :success
        flash[:message] = "Added category #{category.name}"
        return redirect_to add_categories_path(params[:product_id])
      else
        flash[:status] = :failure
        flash[:message] = "Could not create new category"
        flash[:details] = category.errors.messages
        return redirect_to add_categories_path(params[:product_id])
      end
    end
end