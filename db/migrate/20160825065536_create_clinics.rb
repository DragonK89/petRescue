class CreateClinics < ActiveRecord::Migration[5.0]
  def change
    create_table :clinics do |t|
    	t.string :clinic_name
    	t.string :address
    	t.decimal :longitude ,:precision=>64, :scale=>12
      	t.decimal :latitude ,:precision=>64, :scale=>12
      t.timestamps
    end
  end
end
