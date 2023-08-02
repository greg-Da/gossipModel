class User < ApplicationRecord
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    
    belongs_to :city
    has_many :gossips
    has_many :comments
    has_many :multi_pms
    has_many :private_messages, through: :multi_pms
    has_many :sent_messages, class_name: "PrivateMessage",  foreign_key: "sender_id"
    has_many :received_messages, class_name: "MultiPm",  foreign_key: "recipient_id"
end
