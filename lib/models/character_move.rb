class CharacterMove < ActiveRecord::Base

    belongs_to :character 
    belongs_to :move 

end 