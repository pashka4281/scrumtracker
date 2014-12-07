class AddBoardToStory < ActiveRecord::Migration
  def change
    add_column :stories, :board, :string
  end
end
