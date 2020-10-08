class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :image
      t.string :email
      t.string :password_digest
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
