class AddUserIdToFacts < ActiveRecord::Migration
  def change
    add_column :facts, :user_id, :integer
  end
end
