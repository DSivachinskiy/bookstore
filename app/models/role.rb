class Role < ActiveRecord::Base
	has_many :costumers

	validates :role, presence: true
end
