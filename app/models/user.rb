class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Direct associations

  has_many   :net_worths,
             :dependent => :destroy

  # Indirect associations

  # Validations
  validates :username, :presence => true, :uniqueness => true

end
