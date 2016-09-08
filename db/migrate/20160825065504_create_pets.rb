class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
    	t.string :pet_name
    	t.text :description
      t.string :address
    	t.string :before_img_url
      t.string :current_img_url
    	t.integer :foster_status
      t.integer :health_status
    	t.string :confirm_code
      t.decimal :longitude ,:precision=>64, :scale=>12
      t.decimal :latitude ,:precision=>64, :scale=>12
    	t.belongs_to :user , index: true
    	t.belongs_to :clinic , index:true
      t.timestamps
    end
  end
end
