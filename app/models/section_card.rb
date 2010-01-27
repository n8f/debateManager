class SectionCard < ActiveRecord::Base
    belongs_to(:section)
    belongs_to(:card)
end
