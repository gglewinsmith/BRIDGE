class FundraisingEventsController < ApplicationController
  def index
    if current_user.applicant
      @fundraising_events = FundraisingEvent.all
      # @fundraising_events = FundraisingEvent.all.reject { |d| d.user != current_user }
    elsif current_user.lender
      @fundraising_events = FundraisingEvent.all
    end
  end

  def show
    @fundraising_event = FundraisingEvent.find(params[:id])
    # authorize @fundraising_event
    respond_to do |format|
        format.html { render 'fundraising_events/show' }
        format.js
      end
  end

  def new
    @fundraising_event = FundraisingEvent.new
    # authorize @fundraising_event
  end

  def create
    @fundraising_event = FundraisingEvent.new(fundraising_event_params)
    @fundraising_event.user = current_user
    # authorize @fundraising_event
    if @fundraising_event.save
      redirect_to fundraising_event_path(@fundraising_event)
    else
      render :new
    end
  end

  private

  def fundraising_event_params
    params.require(:fundraising_event).permit(:price, :course, :career_goals,
      :date_from, :date_until, :cv, :guarantor, :payback_from, :payback_until)
  end
end
