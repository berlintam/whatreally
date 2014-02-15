class RenameVotesTable < ActiveRecord::Migration
  def change
    rename_table 'votes', 'fact_votes'
  end
end
