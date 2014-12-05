class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :description
      t.integer :project_id
      t.string :type
      t.integer :user_id
      t.string :state
      t.integer :points

      t.timestamps
    end
  end
end
