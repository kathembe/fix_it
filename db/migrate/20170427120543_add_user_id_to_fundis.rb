class AddUserIdToFundis < ActiveRecord::Migration[5.0]
  def change
    add_column :fundis, :user_id, :integer
  end
end
