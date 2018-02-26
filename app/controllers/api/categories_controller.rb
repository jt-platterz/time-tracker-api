module Api
  class CategoriesController < ApiController
    before_action :set_categories
    before_action :set_category, only: :show

    def index
      render json: authorize(@categories)
    end

    def show
      render json: authorize(@category)
    end

    private

    def set_categories
      @categories = Category.all
    end

    def set_category
      @category = @categories.find(params[:id])
    end
  end
end