class CreateApplianceTools < ActiveRecord::Migration
  def self.up
    create_table :appliance_tools do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :appliance_tools
  end
end
