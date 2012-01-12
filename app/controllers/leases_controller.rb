class LeasesController < ApplicationController
  def index
    @leases = Lease.all
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @lease = Lease.find(params[:id])
      respond_to do |format|
      format.html # show.html.erb
    end
  end


  def new
    @lease = Lease.new
    @clients = Client.all
    @partitions = Partition.all
     respond_to do |format|
      format.html # new.html.erb
    end
  end


  def edit
    @lease = Lease.find(params[:id])
    @clients = Client.all
    @partitions = Partition.all
  end


  def create
    @lease = Lease.new(params[:lease])
    respond_to do |format|
      if @lease.save
        format.html { redirect_to(@lease, :notice => 'lease was successfully created.') }   
      else
     @link_types = {"link" => "link", "text" => "text", "both" => "both"} 
     format.html { render :action => "new" }        
      end
    end
  end

  def update
    @lease = Lease.find(params[:id])
    respond_to do |format|
      if @lease.update_attributes(params[:lease])
        format.html { redirect_to(@lease, :notice => 'lease was successfully updated.') }  
      else
        format.html { render :action => "edit" }      
      end
    end
  end


  def destroy
    @lease = Lease.find(params[:id])
    @lease.destroy

    respond_to do |format|
      format.html { redirect_to(leases_url) }
    end
  end
end
