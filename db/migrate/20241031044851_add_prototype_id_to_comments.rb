class AddPrototypeIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :prototype_id, :integer
  end
end
