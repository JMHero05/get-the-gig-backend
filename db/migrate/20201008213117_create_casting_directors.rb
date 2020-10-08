class CreateCastingDirectors < ActiveRecord::Migration[6.0]
  def change
    create_table :casting_directors do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :agency
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
