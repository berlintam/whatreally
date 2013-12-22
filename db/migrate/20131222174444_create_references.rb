class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :ref
      t.integer :fact_id

      t.timestamps
    end
  end
end
