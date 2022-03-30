class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:show]

  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show

    if user_signed_in?
      @applicant = @event.applicants.find_by(my_id: current_user.id)
    end
    
    @all_app = @event.applicants
    @accepted_apps = @all_app.where(status: "approved")
    @pending_apps = @all_app.where(status: "pending")
    @rejected_apps = @all_app.where(status: "rejected")

  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    
   @event = Event.new(event_params)
   @event.event_host = current_user

   location = Location.create({  
    country: params["event"]["country"],
    region: params["event"]["region"],
    address: params["event"]["address"]
   })

   @event.location_id = location.id
    
   respond_to do |format|
     if @event.save
       format.html { redirect_to @event, notice: 'Event was successfully created.' }
       format.json { render :show, status: :created, location: @event}
     else
       format.html { render :new }
       format.json { render json: @event.errors, status: :unprocessable_entity }
     end
   end
 end

 def update
   respond_to do |format|
     if @event.update(event_params)
       format.html { redirect_to @event, notice: 'Event was successfully updated.' }
       format.json { render :show, status: :ok, location: @event }
     else
       format.html { render :edit }
       format.json { render json: @event.errors, status: :unprocessable_entity }
     end
   end
 end

 def destroy
   @event.destroy
   respond_to do |format|
     format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
     format.json { head :no_content }
   end
 end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :min_age, :max_age, :note, :start_date, :end_date, :participant, :sport_id, :status)
    end
    
end
