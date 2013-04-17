class CreateCards < ActiveRecord::Migration
  def self.up
    create_table :cards do |t|
        t.text("tag")
        t.text("cite")
        t.text("contents")
        t.timestamps
    end
  end

  def self.down
    drop_table :cards
  end
end
