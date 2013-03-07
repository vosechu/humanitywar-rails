class CreateBlackCards < ActiveRecord::Migration
  def change
    create_table :black_cards do |t|
      t.string :text
      t.integer :blanks

      t.timestamps
    end
  end
end
