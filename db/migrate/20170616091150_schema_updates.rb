class SchemaUpdates < ActiveRecord::Migration
  def up
    change_column :bookings, :date, :datetime
    add_reference :bookings, :city, index: true, foreign_key: true
  end

  def down
    change_column :bookings, :date, :date
    remove_reference :bookings, :city
  end
end
