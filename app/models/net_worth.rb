class NetWorth < ApplicationRecord
  # Direct associations

  belongs_to :user

  has_many   :assets, 
             :dependent => :destroy

  has_many   :liabilities,
             :dependent => :destroy

  # Indirect associations

  # Validations
  #user_id: presence
    validates :user_id, :presence => true

end
