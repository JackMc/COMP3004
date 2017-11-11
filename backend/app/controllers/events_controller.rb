class EventsController < ApplicationController
  def index
    @events = Event.all

    respond_to do |format|
      format.json { render json: @events.to_json(include: [:company, :room]) }
      format.html
    end
  end

  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.json { render json: @event.to_json }
      format.html
    end
  end

  def create
    room = Room.find(params[:room_id])
    company = Company.find(params[:company_id])

    @event = Event.new(
      name: params[:name],
      description: params[:description],
      start_time: Time.parse(params[:start_time]),
      end_time: Time.parse(params[:end_time]),
      date: Date.parse(params[:date]),
      event_type: params[:event_type],
      room: room,
      company: company
      )
    @event.save!

    respond_to do |format|
      format.json { render json: @event.to_json }
      format.html
    end
  end

  def new
  end

  def destroy
  end
end
