class ReceivingItemsController < ApplicationController
  before_filter :logged_in?

  # GET /receiving_items
  # GET /receiving_items.xml
  def index
    @receiving_items = ReceivingItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @receiving_items }
    end
  end

  # GET /receiving_items/1
  # GET /receiving_items/1.xml
  def show
    @receiving_item = ReceivingItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @receiving_item }
    end
  end

  # GET /receiving_items/new
  # GET /receiving_items/new.xml
  def new
    @receiving_item = ReceivingItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @receiving_item }
    end
  end

  # GET /receiving_items/1/edit
  def edit
    @receiving_item = ReceivingItem.find(params[:id])
  end

  # POST /receiving_items
  # POST /receiving_items.xml
  def create
    @receiving_item = ReceivingItem.new(params[:receiving_item])

    respond_to do |format|
      if @receiving_item.save
        format.html { redirect_to(@receiving_item, :notice => 'Receiving item was successfully created.') }
        format.xml  { render :xml => @receiving_item, :status => :created, :location => @receiving_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @receiving_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /receiving_items/1
  # PUT /receiving_items/1.xml
  def update
    @receiving_item = ReceivingItem.find(params[:id])

    respond_to do |format|
      if @receiving_item.update_attributes(params[:receiving_item])
        format.html { redirect_to(@receiving_item, :notice => 'Receiving item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @receiving_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /receiving_items/1
  # DELETE /receiving_items/1.xml
  def destroy
    @receiving_item = ReceivingItem.find(params[:id])
    @receiving_item.destroy

    respond_to do |format|
      format.html { redirect_to(receiving_items_url) }
      format.xml  { head :ok }
    end
  end
end

