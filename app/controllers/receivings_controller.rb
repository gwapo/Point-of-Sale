class ReceivingsController < ApplicationController
  # GET /receivings
  # GET /receivings.xml
  def index
=begin
    @receivings = Receiving.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @receivings }
    end
=end
   respond_to do |format|

  format.pdf do
		      render :pdf => "my_pdf", # pdf will download as my_pdf.pdf
		        :layout => 'pdf', # uses views/layouts/pdf.haml
		    :show_as_html => params[:debug].present? # renders html version if you set debug=true in URL
		      end

end

  end

  # GET /receivings/1
  # GET /receivings/1.xml
  def show
    @receiving = Receiving.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @receiving }
    end
  end

  # GET /receivings/new
  # GET /receivings/new.xml
  def new
    @receiving = Receiving.new
    @receiving.receiving_items.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @receiving }
    end
  end

  # GET /receivings/1/edit
  def edit
    @receiving = Receiving.find(params[:id])
  end

  # POST /receivings
  # POST /receivings.xml
  def create
    @receiving = Receiving.new(params[:receiving])
    @receiving.employee_id = 1
    respond_to do |format|
      if @receiving.save
        format.html { redirect_to(@receiving, :notice => 'Receiving was successfully created.') }
        format.xml  { render :xml => @receiving, :status => :created, :location => @receiving }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @receiving.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /receivings/1
  # PUT /receivings/1.xml
  def update
    @receiving = Receiving.find(params[:id])

    respond_to do |format|
      if @receiving.update_attributes(params[:receiving])
        format.html { redirect_to(@receiving, :notice => 'Receiving was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @receiving.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /receivings/1
  # DELETE /receivings/1.xml
  def destroy
    @receiving = Receiving.find(params[:id])
    @receiving.destroy

    respond_to do |format|
      format.html { redirect_to(receivings_url) }
      format.xml  { head :ok }
    end
  end
end
