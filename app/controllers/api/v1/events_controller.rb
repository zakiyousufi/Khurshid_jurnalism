class Api::V1::EventsController < ApplicationController
  def index
    events = Event.all

    render json: events, status: :ok
  end

  # GET /events/1
  def show
    event = Event.find(params[:id])

    if event
      render json: event, status: :ok
    else
      render json: event.errors, status: :bad_request
    end
  end

  # POST /events/1/rservation
  def create
    @event = Event.new(event_params)
    if @event.save
      render json: {
        status: { success: true, message: 'Event created successfully' }
      }
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      render json: { success: true, message: 'event deleted successfully' }, status: :ok
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :image, :content, :date, :location)
  end
end
