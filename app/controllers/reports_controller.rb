class ReportsController < ApplicationController
  def index
  end



  def itemsearch
    if params[:history_item_id]

        item_id  = params[:history_item_id]
        year = params[:date][:history_year].to_i

        @item_name  = params[:history_item_name]
        @items_inventories = Inventory.all(:conditions => { :created_at => DateTime.new(year)..DateTime.new(year).end_of_year, :item_id => item_id, :comment => ['Add Item','REC'] } )

    #else
     #   @items_inventories = Inventory.all
    end
  end

    def employeesales

        if !params[:search].blank? &&  (params[:employee_id].to_i != 0)

        employee_id = params[:employee_id].to_i

        @sales = case params[:search]
            when "Yearly"
                year = params[:date][:year].to_i
                Sale.all(:conditions => { :created_at => DateTime.new(year)..DateTime.new(year).end_of_year, :employee_id => employee_id } )
            when "Monthly"
                year = params[:date][:year].to_i
                month = params[:date][:month].to_i
                Sale.all(:conditions => {:created_at => DateTime.new(year,month)..DateTime.new(year,month).end_of_month, :employee_id => employee_id })
            when "Specific Date"
                start_date = params[:start_date]
                end_date = params[:end_date]
                Sale.all(:conditions => {:created_at => DateTime.parse(start_date)..DateTime.parse(end_date).end_of_day, :employee_id => employee_id })
            end

        end



    end

    def customersales

        if !params[:search].blank? &&  (params[:customer_id].to_i != 0)

        customer_id = params[:customer_id].to_i

        @sales = case params[:search]
            when "Yearly"
                year = params[:date][:year].to_i

                Sale.all(:conditions => { :created_at => DateTime.new(year)..DateTime.new(year).end_of_year, :customer_id => customer_id } )
            when "Monthly"
                year = params[:date][:year].to_i
                month = params[:date][:month].to_i
                Sale.all(:conditions => {:created_at => DateTime.new(year,month)..DateTime.new(year,month).end_of_month, :customer_id => customer_id })
            when "Specific Date"
                start_date = params[:start_date]
                end_date = params[:end_date]
                Sale.all(:conditions => {:created_at => DateTime.parse(start_date)..DateTime.parse(end_date).end_of_day, :customer_id => customer_id })
            end

        end

    end



    def sales

        unless params[:search].blank?

        @sales = case params[:search]
            when "Yearly"
                year = params[:date][:year].to_i
                Sale.all(:conditions => {:created_at => DateTime.new(year)..DateTime.new(year).end_of_year })
            when "Monthly"
                year = params[:date][:year].to_i
                month = params[:date][:month].to_i
                Sale.all(:conditions => {:created_at => DateTime.new(year,month)..DateTime.new(year,month).end_of_month })
            when "Specific Date"
                start_date = params[:start_date]
                end_date = params[:end_date]
                Sale.all(:conditions => {:created_at => DateTime.parse(start_date)..DateTime.parse(end_date).end_of_day })
            end

        end

    end


end

