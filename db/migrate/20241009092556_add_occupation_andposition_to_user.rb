class AddOccupationAndpositionToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :occupation, :text
    add_column :users, :position, :text
  end
end
