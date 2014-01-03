class RenamePrivateToPrivateFact < ActiveRecord::Migration
  def change
    rename_column :facts, :private, :private_fact
  end
end
