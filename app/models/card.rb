class Card < ActiveRecord::Base
    has_many(:section_cards)
    has_many(:sections, :through => :section_cards)
end
