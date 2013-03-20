class AddOrderToEntriesWhiteCards < ActiveRecord::Migration
  def change
    add_column :entries_white_cards, :order, :integer, :default => 0
  end
end
