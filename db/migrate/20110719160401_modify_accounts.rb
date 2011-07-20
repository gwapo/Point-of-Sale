class ModifyAccounts < ActiveRecord::Migration
  def self.up
      rename_column :accounts, :title, :client_name
      rename_column :accounts, :start, :check_date

      remove_column :accounts, :end
      remove_column :accounts, :payment_type

      add_column   :accounts, :delivery_no, :string
      add_column   :accounts, :check_number, :string
      add_column   :accounts, :bank_name, :string
      add_column   :accounts, :employee_id, :integer

  end

  def self.down

      rename_column :accounts, :client_name, :title
      rename_column :accounts, :check_date, :start

      add_column :accounts, :end, :datetime
      add_column :accounts, :payment_type, :string

      remove_column   :accounts, :delivery_no
      remove_column   :accounts, :check_number
      remove_column   :accounts, :bank_name
      remove_column   :accounts, :employee_id

  end
end

