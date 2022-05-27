class City < ApplicationRecord
    has_many :sites, dependent: :destroy
end
