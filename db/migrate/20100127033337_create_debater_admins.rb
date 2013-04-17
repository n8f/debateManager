class CreateDebaterAdmins < ActiveRecord::Migration
  def self.up
    create_table :debater_admins do |t|
        t.integer("debater_id")
        t.boolean("admin")
        t.timestamps
    end
  end

  def self.down
    drop_table :debater_admins
  end
end
