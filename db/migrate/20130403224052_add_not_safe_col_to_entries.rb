class AddNotSafeColToEntries < ActiveRecord::Migration
  def change
  	add_column :entries, :notsafe, :boolean, :default => true
  end
end
