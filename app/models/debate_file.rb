class DebateFile < ActiveRecord::Base
    has_many(:file_sections)
    has_many(:sections, :through => :file_sections)
end
