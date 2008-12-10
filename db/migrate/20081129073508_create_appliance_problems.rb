class CreateApplianceProblems < ActiveRecord::Migration
  def self.up
    create_table :appliance_problems do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :appliance_problems
  end
end
