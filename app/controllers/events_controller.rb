class EventsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @events = @user.events
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      @events = Event.all
      else
        render :index
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to events_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @events = Event.all
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to events_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :body, :start_time)
  end
end