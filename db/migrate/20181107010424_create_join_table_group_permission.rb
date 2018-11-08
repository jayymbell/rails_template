class CreateJoinTableGroupPermission < ActiveRecord::Migration[5.1]
  def change
    create_join_table :groups, :permissions do |t|
       t.index [:group_id, :permission_id]
    end
  end
end
