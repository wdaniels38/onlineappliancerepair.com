class CreateApplianceBrands < ActiveRecord::Migration
  def self.up
    create_table :appliance_brands do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :appliance_brands
  end
end
