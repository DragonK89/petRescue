class AddTitleAndViewsToStories < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :title, :string
    add_column :stories, :view_numb, :integer
  end
end
