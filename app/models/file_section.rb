class FileSection < ActiveRecord::Base
    belongs_to(:debate_file)
    belongs_to(:section)
end
