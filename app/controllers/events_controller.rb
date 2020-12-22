class EventsController < ApplicationController
  def index
    @events = Event.all
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

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    @events = Event.all
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_parameter)
      redirect_to events_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :body, :start_time)
  end
end