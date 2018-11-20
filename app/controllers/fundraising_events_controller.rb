class FundraisingEventsController < ApplicationController
    def show
      @fundraising_event = FundraisingEvent.find(params[:id])
      authorize @fundraising_event

    end

    def new
      @fundraising_event = FundraisingEvent.new
      authorize @fundraising_event
    end


    def create

      @fundraising_event = FundraisingEvent.new(fundraising_event_params)
      @fundraising_event.user = current_user
      authorize @fundraising_event
      if @fundraising_event.save
      redirect_to fundraising_event_path(@fundraising_event)
      else
        render :new
      end
    end

  private

  def fundraising_event_params
    params.require(:fundraising_event).permit(:amount, :course, :career_goals, :date_from, :date_until, :cv, :guarantor, :payback_from,  :payback_until)
  end
end
