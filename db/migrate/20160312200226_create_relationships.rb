class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :follower, null: false
      t.references :followed, null: false
      t.timestamps null: false
    end

    add_foreign_key :users, :users, column: :follower_id
    add_foreign_key :users, :users, column: :followed_id
  end
end
