class User < ActiveRecord::Base
  has_many :posts, :dependent => :destroy

  validates_presence_of   :username
  validates_uniqueness_of :username, :allow_blank => true
  validates_format_of     :username, :with  => /[\w\-\_]+/i, :allow_blank => true

  # Include default devise modules. Others available are:
  # :token_authenticatable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  ROLES = %w[admin moderator user]
  bitmask :roles, :as => ROLES

  # Add user role for all confirmed users
  def confirm!
    self.roles << 'user'
    super
  end

  # Allow user authorize by login or email
  def self.find_for_database_authentication(conditions)
    conditions = ["username = ? or email = ?", conditions[authentication_keys.first], conditions[authentication_keys.first]]
    # raise StandardError, conditions.inspect
    super
  end
end
