class CitiesCleaners < ActiveRecord::Migration
  def up
    create_join_table :cities, :cleaners do |t|
      t.index :city_id
      t.index :cleaner_id
    end
  end

  def down
    drop_join_table :cities, :cleaners
  end
end
