class StoreConfigsController < ApplicationController
    before_filter :logged_in?
    # layout "twocolumn"
    before_filter :getPageTitle
    before_filter :queryStore, :except => [:index, :new, :create]

  # GET /store_configs
  # GET /store_configs.xml
  def index
    @store_configs = StoreConfig.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @store_configs }
    end
  end

  # GET /store_configs/1
  # GET /store_configs/1.xml
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @store_config }
    end
  end

  # GET /store_configs/new
  # GET /store_configs/new.xml
  def new
    @store_config = StoreConfig.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @store_config }
    end
  end

  # GET /store_configs/1/edit
  def edit
  end

  # POST /store_configs
  # POST /store_configs.xml
  def create
    @store_config = StoreConfig.new(params[:store_config])

    respond_to do |format|
      if @store_config.save
        format.html { redirect_to(@store_config, :notice => 'Store config was successfully created.') }
        format.xml  { render :xml => @store_config, :status => :created, :location => @store_config }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @store_config.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /store_configs/1
  # PUT /store_configs/1.xml
  def update

    respond_to do |format|
      if @store_config.update_attributes(params[:store_config])
        format.html { redirect_to(@store_config, :notice => 'Store config was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @store_config.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /store_configs/1
  # DELETE /store_configs/1.xml
  def destroy
    @store_config.destroy

    respond_to do |format|
      format.html { redirect_to(store_configs_url) }
      format.xml  { head :ok }
    end
  end

private

    def getPageTitle
        @pagetitle = "Store Configuration"
    end
    def queryStore
        @store_config = StoreConfig.find(params[:id])
    end
end

