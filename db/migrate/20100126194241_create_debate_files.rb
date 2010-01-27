class CreateDebateFiles < ActiveRecord::Migration
  def self.up
    create_table :debate_files do |t|
        t.string("title")
        t.string("notes")
        t.timestamps
    end
  end

  def self.down
    drop_table :debate_files
  end
end
