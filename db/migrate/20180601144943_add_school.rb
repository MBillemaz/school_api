class AddSchool < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name 
      t.string :address
      t.string :postal_code
      t.string :commune
      t.string :horaire
      t.string :phone_number
      t.string :mail
      t.float :latitude
      t.float :longitude
      t.integer :nb_student
      t.string :type
    end
  end
end
