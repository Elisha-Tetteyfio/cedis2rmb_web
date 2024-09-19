class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :role

  before_create :set_username

  def username_initials
    if self.username
      name_parts = self.username.split.take(2)
    
      initials = name_parts.map { |name| name[0].upcase }.join
      
      initials
    else
      "GU"
    end
  end

  private

  def set_username
    self.username = email.split('@').first
  end
end
