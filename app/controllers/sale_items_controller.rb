class SaleItemsController < ApplicationController
  # GET /sale_items
  # GET /sale_items.xml
  def index
    @sale_items = SaleItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sale_items }
    end
  end

  # GET /sale_items/1
  # GET /sale_items/1.xml
  def show
    @sale_item = SaleItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sale_item }
    end
  end

  # GET /sale_items/new
  # GET /sale_items/new.xml
  def new
    @sale_item = SaleItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sale_item }
    end
  end

  # GET /sale_items/1/edit
  def edit
    @sale_item = SaleItem.find(params[:id])
  end

  # POST /sale_items
  # POST /sale_items.xml
  def create
    @sale_item = SaleItem.new(params[:sale_item])

    respond_to do |format|
      if @sale_item.save
        format.html { redirect_to(@sale_item, :notice => 'Sale item was successfully created.') }
        format.xml  { render :xml => @sale_item, :status => :created, :location => @sale_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sale_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sale_items/1
  # PUT /sale_items/1.xml
  def update
    @sale_item = SaleItem.find(params[:id])

    respond_to do |format|
      if @sale_item.update_attributes(params[:sale_item])
        format.html { redirect_to(@sale_item, :notice => 'Sale item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sale_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sale_items/1
  # DELETE /sale_items/1.xml
  def destroy
    @sale_item = SaleItem.find(params[:id])
    @sale_item.destroy

    respond_to do |format|
      format.html { redirect_to(sale_items_url) }
      format.xml  { head :ok }
    end
  end
end
