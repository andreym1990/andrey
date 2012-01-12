class SchedulePaymentsController < ApplicationController
 def index
    @schedule_payments = SchedulePayment.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @schedule_payment = SchedulePayment.find(params[:id])
      respond_to do |format|
      format.html # show.html.erb
    end
  end


  def new
    @schedule_payment = SchedulePayment.new
    @clients = Client.all
    @accounts = Account.all
    respond_to do |format|
      format.html # new.html.erb
    end
  end


  def edit
    @schedule_payment = SchedulePayment.find(params[:id])
    @clients = Client.all
    @accounts = Account.all
   
end


  def create
    @schedule_payment = SchedulePayment.new(params[:schedule_payment])

    respond_to do |format|
      if @schedule_payment.save
        format.html { redirect_to(@schedule_payment, :notice => 'schedule payment was successfully created.') }   
      else
        format.html { render :action => "new" }        
      end
    end
  end

  def update
    @schedule_payment = SchedulePayment.find(params[:id])
    respond_to do |format|
      if @schedule_payment.update_attributes(params[:schedule_payment])
        format.html { redirect_to(@schedule_payment, :notice => 'schedule_payment was successfully updated.') }  
      else
        format.html { render :action => "edit" }      
      end
    end
  end


  def destroy
    @schedule_payment = SchedulePayment.find(params[:id])
    @schedule_payment.destroy

    respond_to do |format|
      format.html { redirect_to(schedule_payments_url) }
    end
  end


end
