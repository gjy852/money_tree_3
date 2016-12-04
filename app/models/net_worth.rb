class NetWorth < ApplicationRecord
  # Direct associations

  has_many   :assets,
             :dependent => :destroy

  has_many   :liabilities,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
