class AddAuditionRequestBooleansToAuditions < ActiveRecord::Migration[6.0]
  def change
    add_column :auditions, :requested, :boolean, :default => true
    add_column :auditions, :confirmed, :boolean, :default => false
    add_column :auditions, :rejected, :boolean, :default => false
  end
end
