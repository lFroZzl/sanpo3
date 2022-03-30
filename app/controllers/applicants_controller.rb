class ApplicantsController < ApplicationController

    before_action :authenticate_user!

    before_action :set_applicant, only: [:update, :destroy]

    def index
        @applicants = Applicant.all
    end

    def show
    end

    def new
    end

    def edit
    end

    def create
        @applicant = Applicant.new(applicant_params)
        @applicant.status = "pending"
        respond_to do |format|
            if @applicant.save
            format.html { redirect_to @applicant.event, notice: 'applicant was successfully created.' }
            else
            format.html { redirect_to @applicant.event, notice: 'Error. applicant was not created.' }
            end
        end
    end 

    def update
        respond_to do |format|
            if @applicant.update(applicant_params)
            format.html { redirect_to @applicant.event, notice: 'applicant was successfully updated.' }

            else
            format.html { redirect_to @applicant.event, notice: 'Applicant wasn\'t updated' }
            end
        end
    end

    def destroy
        @applicant.destroy
        respond_to do |format|
            format.html { redirect_to @applicant.event, notice: 'applicant was successfully destroyed.' }
            format.json { head :no_content }
        end
    end



  private

    def set_applicant
      @applicant = Applicant.find(params[:id])
    end

    def applicant_params
      params.require(:applicant).permit(:status, :my_id, :event_id)
    end
    
end