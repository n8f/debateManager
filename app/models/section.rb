class Section < ActiveRecord::Base
    has_many(:section_cards)
    has_many(:cards, :through => :section_cards)

    has_many(:file_sections)
    has_many(:debate_files, :through => :file_sections)

end
