class Participation < ActiveRecord::Base
  belongs_to :participant, class_name: "User", foreign_key: :participant_id
  belongs_to :event
  
end
