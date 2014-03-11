class CreateSnapsTags < ActiveRecord::Migration
  def change
    create_table :snaps_tags do |t|
      t.integer :snap_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
