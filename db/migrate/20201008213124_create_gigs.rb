class CreateGigs < ActiveRecord::Migration[6.0]
  def change
    create_table :gigs do |t|
      t.belongs_to :casting_director, null: false, foreign_key: true
      t.string :title
      t.string :gig_type
      t.boolean :union
      t.string :producer
      t.string :director
      t.string :choreographer
      t.string :music_director
      t.date :opening_date
      t.date :closing_date
      t.string :gig_location
      t.string :pay_rate
      t.date :audition_date
      t.string :audition_location

      t.timestamps
    end
  end
end
