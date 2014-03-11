class AddUseridToSnap < ActiveRecord::Migration
  def change
    add_column :snaps, :user_id, :integer
  end
end
