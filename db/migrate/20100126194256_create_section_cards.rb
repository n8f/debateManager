class CreateSectionCards < ActiveRecord::Migration
  def self.up
    create_table :section_cards do |t|
        t.integer("section_id")
        t.integer("card_id")
        t.integer("order")
        t.timestamps
    end
  end

  def self.down
    drop_table :section_cards
  end
end
