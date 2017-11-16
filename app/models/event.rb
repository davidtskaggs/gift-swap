class Event < ApplicationRecord
  validates :name, :description, :suggested_budget, :creator_id, presence: true

  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  has_many :participations, dependent: :destroy
  has_many :participants, through: :participations, dependent: :destroy
  accepts_nested_attributes_for :participations

  def create_pairs
    participants = self.participants.shuffle
    nb_participants = participants.length
    temp = participants[0]
    assignees = Array.new(nb_participants, 0)
    participants.each_with_index do |elt, index|
      assignees[index] = participants[index+1]
    end
    assignees[(nb_participants-1)] = temp
    pairs = assignees.zip(participants)
    pairs.each_with_index do |elt, index|
      GiftExchange.create(recipient_id: elt[0].id, sender_id: elt[1].id, event_id: self.id, wishlist_item_id: 1)
    end
  end
end



# ALGORITHM 2
#   def assign
#       @participants_A = self.participants.dup.to_a
#       @participants_B = self.participants.dup.to_a
#     until @participants_A.length == 0
#       @participants_A.shuffle
#       @participants_B.shuffle
#       # binding.pry
#       group_a = @participants_A.pop
#       group_b = @participants_B.pop
#       if group_a == group_b && @participants_B.length == 1 && @participants_A.length == 1
#         animals = GiftExchange.find_by(event_id: self.id)
#         animals.destroy
#       elsif group_a == group_b
#         @participants_B.push(group_b)
#         pig = @participants_B.shift
#         GiftExchange.create(recipient: group_a, sender: pig, event_id: 1, wishlist_item_id: 1)
#       else
#         GiftExchange.create(recipient: group_a, sender: group_b, event_id: 1, wishlist_item_id: 1)
#       end
#     end
#   end
# end

# ALGORITHM 1
    # pairs = participants.shuffle
    # assignments = pairs.zip(participants)
    # assignments.each do |assignment|
    #   # p assignment
    #   # p assignment[0]
    #   # p assignment[1]
    #   if assignment[0] == @current_user && assignment[1] == @current_user
    #     pairs = participants.shuffle
    #     assignments = pairs.zip(participants)
    #   else
    #   @gift_exchange = GiftExchange.create(recipient: assignment[0], sender: assignment[1], event_id: 1, wishlist_item_id: 1)
    #   end
  #   end
  # end

