class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :omniauthable, :omniauth_providers => [:google_oauth2]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :user_name, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :street, :town, :county, :post_code, :dob
  # attr_accessible :title, :body

  validates :user_name, :presence => true, :uniqueness => true
  validates :email, :password, :password_confirmation, :first_name, :last_name, :presence => true

  has_many :portfolios
  has_many :stocks, through: :portfolios
  has_many :authentications


def self.find_for_oauth(kind, auth, signed_in_user=nil)

    case kind
    when "google", "github"
      if user = signed_in_user || User.find_by_email(auth.info.email)
        name = auth.info.name.split(' ')
        user.first_name = name.shift if user.first_name.blank?
        user.last_name = name.pop if user.last_name.blank?
        user.save
      elsif auth_record = Authentication.find_by_provider_and_uid(auth.provider, auth.uid)
        return auth_record.user
      else
        user = User.create do |user|
          name = auth.info.name.split(' ')
          user.first_name = name.shift
          user.last_name = name.join(' ')
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
        end
      end
    when "facebook"
      raise NotImplementedError, "why would anybody want this!"
    end

    if user.persisted?
      user.authentications.where(auth.slice(:provider, :uid)).first_or_create!
    end

    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if auth = session["devise.google_data"] || session["devise.github_data"]
        user.name = auth.info.name if user.name.blank?
        user.email = auth.info.email if user.email.blank?
      end
    end
  end
end