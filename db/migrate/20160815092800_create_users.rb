class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :user_name 
      t.string :display_name
      t.decimal :phone_number
      t.decimal :longitude ,:precision=>64, :scale=>12
      t.decimal :latitude ,:precision=>64, :scale=>12
      t.string :address
      t.string :password
      t.timestamps
    end
  end
end
