class MultiPm < ApplicationRecord
    belongs_to :recipient,  class_name: "User", foreign_key: "recipient_id"
    belongs_to :private_message
end
