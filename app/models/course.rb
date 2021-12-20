class Course < ApplicationRecord
  has_many :items, dependent: :destroy

  enum name: { single: 0, randam: 1, season_single: 2, season_randam: 3 }
end
