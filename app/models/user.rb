class User < ApplicationRecord
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    
    belongs_to :city
    has_many :gossips, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :multi_pms, dependent: :destroy
    has_many :private_messages, through: :multi_pms
    has_many :sent_messages, class_name: "PrivateMessage",  foreign_key: "sender_id"
    has_many :received_messages, class_name: "MultiPm",  foreign_key: "recipient_id"

      
  def remember(remember_token)
    remember_digest = BCrypt::Password.create(remember_token)
    self.update(remember_digest: remember_digest)
  end
end
