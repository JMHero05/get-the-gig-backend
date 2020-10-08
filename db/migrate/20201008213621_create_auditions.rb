class CreateAuditions < ActiveRecord::Migration[6.0]
  def change
    create_table :auditions do |t|
      t.belongs_to :actor, null: false, foreign_key: true
      t.belongs_to :role, null: false, foreign_key: true
      t.time :time
      t.string :location
      t.date :date

      t.timestamps
    end
  end
end
