class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.text :story
      t.belongs_to :pet
      t.timestamps
    end
  end
end
