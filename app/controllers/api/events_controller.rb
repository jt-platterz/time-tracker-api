module Api
  class EventsController < ApiController
    before_action :set_events, except: :show
    before_action :set_event, only: [:show, :update, :destroy]

    def create
      @event = Event.new(permitted_params) do |e|
        e.datetime = DateTime.now
        e.user = current_user
      end

      authorize(@event).save!

      render json: @event
    end

    def index
      render json: authorize(@events)
    end

    def show
      render json: authorize(@event)
    end

    def update
      authorize(@event).update!(permitted_params)
      render json: @event
    end

    def destroy
      @event.destroy!
      head :no_content
    end

    private

    def set_events
      if (params[:date].present? && DateTime.parse(params[:date])) || params[:subcategory_id].present?
        @events = Event.where(user: current_user)
        @events = @events.where(subcategory_id: params[:subcategory_id]) if params[:subcategory_id].present?
        @events = @events.for_date(DateTime.parse(params[:date])) if params[:date].present?
      else 
        @events = Event.none
      end
    end

    def set_event
      @event = Event.find(params[:id])
    end

    def permitted_params
      params.require(:event).permit(:title, :time, :category_id)
    end
  end
end