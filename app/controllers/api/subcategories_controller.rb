module Api
  class SubcategoriesController < ApiController
    before_action :set_subcategories
    before_action :set_subcategory, only: :show

    def index
      render json: @subcategories
    end

    def show
      render json: @subcategory
    end

    private

    def set_subcategories
      @subcategories = Subcategory.all
      @subcategories = @subcategories.where(category_id: params[:category_id]) if params[:category_id]
    end

    def set_subcategory
      @subcategory = @subcategories.find(params[:id])
    end
  end
end