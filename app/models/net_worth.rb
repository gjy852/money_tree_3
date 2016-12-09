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
  #liabilities_id: presence
    validates :liabilities_id, :presence => true
  # asset_id: presence
    validates :asset_total_id, :presence => true
  # net worth total: presence
    validates :net_worth_total_id, :presence => true
end
