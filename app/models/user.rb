class User < ApplicationRecord
  # Direct associations

  has_many   :net_worths,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
