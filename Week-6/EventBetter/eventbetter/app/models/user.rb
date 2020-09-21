require 'open-uri'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_send
  before_save :add_avatar

  has_many :attendances, dependent: :destroy
  has_many :events, through: :attendances
  has_many :hosts, foreign_key: 'host_id', class_name: "Event", dependent: :destroy
  has_one_attached :avatar


  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def add_avatar
    avatar_url = Faker::Avatar.image
    avatar = open(avatar_url)
    self.avatar.attach(io: avatar, filename: avatar_url)
  end


end
