class CreateEntriesWhiteCards < ActiveRecord::Migration
  def up
    create_table :entries_white_cards do |t|
      t.integer :entry_id
      t.integer :white_card_id
    end
  end

  def down
  end
end
