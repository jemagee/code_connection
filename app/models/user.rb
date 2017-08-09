class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login

  after_create :send_welcome_email

  validates :username, presence: true, uniqueness: { case_sensitive: false },
    format: { with: /\A[a-zA-Z0-9_\.]*\z/ },
    length: { minimum: 6, allow_blank: true }

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end

  private

  def send_welcome_email
    WelcomeMailer.welcome_email(self).deliver
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      query = 'lower(username) = :value OR lower(email) = :value'
      where(conditions.to_h).where(query, { value: login.downcase }).first
    end
  end


end
