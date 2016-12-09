class Liability < ApplicationRecord
  # Direct associations

  belongs_to :liabilities_type,
             :class_name => "LiabilityType"

  belongs_to :net_worth

  # Indirect associations

  # Validations
  #liabilities_type: presence
    validates :liabilities_type, :presence => true
  #liablities_value: only numbers
    validates :liabilities_value, :numericality => true
  #net_worth_id: presence
    validates :net_worth_id, :presence => true
end
