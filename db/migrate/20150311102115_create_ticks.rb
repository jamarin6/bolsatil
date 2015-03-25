class CreateTicks < ActiveRecord::Migration
  def change
    create_table :ticks do |t|
      t.float :high
      t.float :low
      t.float :avg
      t.float :vol
      t.float :vol_cur
      t.float :last
      t.float :buy
      t.float :sell
      t.integer :update_value

      t.timestamps
    end
  end
end
