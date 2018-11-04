class Status < ApplicationRecord
	has_many :attendances, dependent: :destroy
end
