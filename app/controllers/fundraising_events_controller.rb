class FundraisingEventsController < ApplicationController
    def index

    end

    def new
      @fundraising_event = FundraisingEvent.new
      authorize @fundraising_event
    end


    def create
      @fundraising_event = FundraisingEvent.new(fundraising_event_params)
      @fundraising_event.user = current_user
      authorize @fundraising_event
      redirect_to root_path
    end


  private

  def fundraising_event_params
    params.require(:fundraising_event).permit(:course, :career_goals, :date_from, :date_until, :cv, :guarantor, :payback_from, :payback_until)
  end
end
