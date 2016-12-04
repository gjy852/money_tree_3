class Liability < ApplicationRecord
  # Direct associations

  belongs_to :liabilities_type,
             :class_name => "LiabilityType"

  belongs_to :net_worth

  # Indirect associations

  # Validations

end
