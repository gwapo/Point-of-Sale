class SalesController < ApplicationController
  # GET /sales
  # GET /sales.xml

  def index
    @sales = Sale.all(:conditions => {:order => 1})

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sales }
    end
  end

 # /purchase
  def purchase
    @sales = Sale.all(:conditions => {:order => 0})

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sales }
    end
  end

  # GET /sales/1
  # GET /sales/1.xml
  def show
    @sale = Sale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sale }
    end
  end

  # GET /sales/new
  # GET /sales/new.xml
  def new
    @sale = Sale.new
    @sale.sale_items.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sale }
    end
  end

  # GET /sales/1/edit
  def edit
    @sale = Sale.find(params[:id])
  end

  # POST /sales
  # POST /sales.xml
  def create
    @sale = Sale.new(params[:sale])
    @sale.employee_id = 1

    respond_to do |format|
      if @sale.save
       @quantity_purchased = []

       @saleitems = SaleItem.find(:all, :conditions => { :sale_id => @sale.id })
       #@saleitems.each do |sale_item|
       #  @quantity_purchased   << sale_item.quantity_purchased
       #end

        format.html  { redirect_to(@sale, :notice => 'Sale  was successfully created.') }
        format.xml  { render :xml => @sale, :status => :created, :location => @sale }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sales/1
  # PUT /sales/1.xml
  def update
    @sale = Sale.find(params[:id])

    respond_to do |format|
      if @sale.update_attributes(params[:sale])
        format.html { redirect_to(@sale, :notice => 'Sale was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sale.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.xml
  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to(sales_url) }
      format.xml  { head :ok }
    end
  end


  # GET /sales/new
  # GET /sales/new.xml
  def sale_return
    @sale = Sale.new


        @sale.sale_items.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sale }
    end
  end

    # POST /sales
  # POST /sales.xml
  def sale_return_create
    @sale = Sale.new(params[:sale])

    respond_to do |format|
      if @sale.save
        format.html { redirect_to(sales_url) }
        format.xml  { render :xml => @sale, :status => :created, :location => @sale }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sale.errors, :status => :unprocessable_entity }
      end
    end
  end



    #def number_of_quantity
    #    @item_amount.inject(:+)
    #end #eof number_of_quantity

    def totalamount unit_price = 0, quantity = 0, discount = 0
        if discount > 0
           subamount( unit_price,quantity) - (subamount( unit_price,quantity)  * (discount.to_f/100))
        else
           subamount( unit_price,quantity)
        end
    end#eof totalamount unit_price = 0, quantity = 0, discount = 0

    def subamount unit_price , quantity
        unit_price.to_f * quantity.to_i
    end #subamount unit_price , quantity



end

