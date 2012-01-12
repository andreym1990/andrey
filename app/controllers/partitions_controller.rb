class PartitionsController < ApplicationController
def index
    @partitions = Partition.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @partitions }
    end
  end

  # GET /partitions/1
  # GET /partitions/1.xml
  def show
    @partition = Partition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @partition }
    end
  end

  # GET /partitions/new
  # GET /partitions/new.xml
  def new
    @partition = Partition.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @partition }
    end
  end

  # GET /partitions/1/edit
  def edit
    @partition = Partition.find(params[:id])
    @clients = Client.all
  end

  # POST /partitions
  # POST /partitions.xml
  def create
    @partition = Partition.new(params[:partition])

    respond_to do |format|
      if @partition.save
        format.html { redirect_to(@partition, :notice => 'partition was successfully created.') }
        format.xml  { render :xml => @partition, :status => :created, :location => @partition }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @partition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /partitions/1
  # PUT /partitions/1.xml
  def update
    @partition = Partition.find(params[:id])

    respond_to do |format|
      if @partition.update_attributes(params[:partition])
        format.html { redirect_to(@partition, :notice => 'partition was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @partition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /partitions/1
  # DELETE /partitions/1.xml
  def destroy
    @partition = Partition.find(params[:id])
    @partition.destroy

    respond_to do |format|
      format.html { redirect_to(partitions_url) }
      format.xml  { head :ok }
    end
  end
end
