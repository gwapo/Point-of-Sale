require 'test_helper'

class StoreConfigTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: store_configs
#
#  id           :integer(4)      not null, primary key
#  company_name :string(255)
#  email        :string(255)
#  fax          :string(255)
#  phone        :string(255)
#  website      :string(255)
#  address      :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

