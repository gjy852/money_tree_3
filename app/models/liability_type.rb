class LiabilityType < ApplicationRecord
  # Direct associations

  has_one    :liability,
             :foreign_key => "liabilities_type_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
