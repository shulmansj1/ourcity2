class Article < ApplicationRecord
  # Direct associations

  has_many   :likes,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
