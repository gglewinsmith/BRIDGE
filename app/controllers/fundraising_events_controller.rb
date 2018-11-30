class FundraisingEventsController < ApplicationController
  def index
    if current_user.applicant
      @fundraising_events = FundraisingEvent.all.select { |d| d.user == current_user }
    elsif current_user.lender
      @fundraising_events = FundraisingEvent.all
    end
  end

  def show
    @fundraising_event = FundraisingEvent.find(params[:id])
    @loans = Loan.find(@fundraising_event.loan_ids)
    @raised = ((@fundraising_event.amount_raised / @fundraising_event.price) * 100).round
    if (@fundraising_event.amount_due == 0) && (@fundraising_event.amount_raised != 0)
      @repaid = 100
    elsif (@fundraising_event.amount_due == 0) && (@fundraising_event.amount_raised == 0)
      @repaid = 0
    else
      @loans.each do |loan|
        if current_user.lender == true
          @total_loan_for_user = 0
          @total_loan_repaid_for_user = 0
          @total_loan_for_user += loan.amount if loan.user == current_user
          @total_loan_repaid_for_user += loan.amount_repaid if loan.user == current_user
          @repaid = ((@total_loan_repaid_for_user / @total_loan_for_user) * 100).round.to_i
        elsif current_user.applicant == true
          @repaid = ((@fundraising_event.amount_repaid / @fundraising_event.amount_due) * 100).round
        end
      end
    end
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
    # @fundraising_event.amount_due = @fundraising_event.price * (1.004167 ** @fundraising_event.loan_length)
    # authorize @fundraising_event
    if @fundraising_event.save
      redirect_to fundraising_event_path(@fundraising_event)
    else
      render :new
    end
  end

  def destroy
    @fundraising_event = FundraisingEvent.find(params[:id])
    @fundraising_event.destroy
    redirect_to dashboard_path
  end

  def cv
    @fundraising_event = FundraisingEvent.find(params[:fundraising_event_id])
  end

  private

  def fundraising_event_params
    params.require(:fundraising_event).permit(:price, :course, :career_goals, :loan_length,
      :date_from, :date_until, :photo, :guarantor, :payback_from, :payback_until)
  end
end
