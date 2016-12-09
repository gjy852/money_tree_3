class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Direct associations

  has_many   :net_worths,
             :dependent => :destroy
  has_many   :assets, :through => :net_worth
  has_many   :liabilities, :through => :net_worth

  # Indirect associations

  # Validations
  validates :email, :uniqueness => true
  validates :username, :presence => true, :uniqueness => true

end
