class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: [:site_admin], multiple: false)                                      ##
  ############################################################################################


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  validates_presence_of :name

  validates :password, length: { in: 6..20 } 

  has_many :comments, dependent: :destroy

  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      #user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
  #def get_facebook_messages
  #  begin
  #    contacts_fb
  #    @messages = retrieves_messages
  #  rescue IOError => e
  #    flash[:error] = "Error occured contacting facebook: #{e}"
  #  end
  #end
