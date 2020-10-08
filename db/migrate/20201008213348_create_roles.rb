class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.belongs_to :gig, null: false, foreign_key: true
      t.string :role_type
      t.string :name
      t.text :description
      t.string :gender
      t.integer :beg_age_range
      t.integer :end_age_range

      t.timestamps
    end
  end
end
