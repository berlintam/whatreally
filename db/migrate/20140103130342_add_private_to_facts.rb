class AddPrivateToFacts < ActiveRecord::Migration
  def change
    add_column :facts, :private, :boolean
  end
end
