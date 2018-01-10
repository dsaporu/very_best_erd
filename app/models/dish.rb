class Dish < ApplicationRecord
  # Direct associations

  belongs_to :cusine

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
