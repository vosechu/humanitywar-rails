class AddOrderToEntriesWhiteCards < ActiveRecord::Migration
  def change
    add_column :entries_white_cards, :weight, :integer, :default => 0
  end
end
