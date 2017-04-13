class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_welcome_email

  validates :username, presence: true, uniqueness: { case_sensitive: false },
    format: { with: /\A[a-zA-Z0-9_\.]*\z/ },
    length: { minimum: 6, allow_blank: true }

  private

    def send_welcome_email
      WelcomeMailer.welcome_email(self).deliver
    end
end
