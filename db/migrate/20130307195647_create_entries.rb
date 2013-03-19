class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :playa
      t.references :black_card
      t.integer :wins
      t.integer :loses
      t.integer :draws

      t.timestamps
    end
    add_index :entries, :playa_id
    add_index :entries, :black_card_id
  end
end
