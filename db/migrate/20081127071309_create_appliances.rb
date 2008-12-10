class CreateAppliances < ActiveRecord::Migration
  def self.up
    create_table :appliances do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :appliances
  end
end
