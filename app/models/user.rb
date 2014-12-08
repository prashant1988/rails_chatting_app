class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :conversations, :foreign_key => :sender_id       

  def gravatar_url
    downcased_stripped_email=email.strip.downcase
    hash= Digest::MD5.hexdigest(downcased_stripped_email)
    "http://gravatar.com/avatar/#{hash}" 
  end
end
