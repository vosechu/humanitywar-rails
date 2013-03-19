class CreateEntriesWhiteCards < ActiveRecord::Migration
  def change
    create_table :entries_white_cards do |t|
      t.integer :entry_id
      t.integer :white_card_id
    end
  end
end
