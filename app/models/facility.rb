class Facility < ApplicationRecord
  has_many :units, dependent: :destroy
  has_many :insurances, dependent: :destroy
end
