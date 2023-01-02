class User < ApplicationRecord

  # MODULE INITIALIZERS

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # VALIDATIONS

  validates :nickname, presence: true

  private

  def after_confirmation
    WelcomeMailer.send_greetings_notification(self).deliver_now
  end
end
