class CreateFileSections < ActiveRecord::Migration
  def self.up
    create_table :file_sections do |t|
        t.integer("debate_file_id")
        t.integer("section_id")
        t.integer("order")
        t.timestamps
    end
  end

  def self.down
    drop_table :file_sections
  end
end
