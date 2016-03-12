class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :text, limit: 160, null: false
      t.references :user, null: false
      t.foreign_key :users
      t.timestamps null: false
    end
  end
end
