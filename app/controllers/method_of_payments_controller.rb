class MethodOfPaymentsController < ApplicationController

def new 
@methodOfPayment = MethodOfPayment.new
respond_to do |format| 
format.html #new.html.erb
end
end

def create
@methodOfPayment = MethodOfPayment.new(params[:method_of_payment])
 respond_to do |format|     
 if @methodOfPayment.save         
format.html { redirect_to(@methodOfPayment, :notice => 'method of payment was successfully created.') }
     else
        format.html { render :action => "new" }
     end
end
end

def show
    @methodOfPayment = MethodOfPayment.find(params[:id])
     respond_to do |format| 
     format.html # show.html.erb     
    end
end

def index
    @methodOfpayments = MethodOfPayment.all
respond_to do |format|
    format.html #index.html.erb
end 
end

def edit
    @methodOfPayment = MethodOfPayment.find(params[:id])
end

def update
 @methodOfPayment = MethodOfPayment.find(params[:id])
respond_to do |format|         
 if @methodOfPayment.update_attributes(params[:method_of_payment])
       
format.html { redirect_to(@methodOfPayment, :notice => ' method of Payment was successfully updated.') }
        else
        format.html { render :action => "edit" }
        end
      end
    end

def destroy
@methodOfPayment = MethodOfPayment.find(params[:id])
@methodOfPayment.destroy
respond_to do |format|    
    format.html { redirect_to(method_of_payments_url) }
end 
end
end

