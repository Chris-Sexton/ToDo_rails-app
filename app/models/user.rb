class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable    
  has_many :todo_lists
  has_many :todo_items, through: :todo_lists

  validates :password, :presence => true

  def self.from_omniauth(auth)  
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  enum role: [:user, :editor, :admin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    role ||= :user
  end

end