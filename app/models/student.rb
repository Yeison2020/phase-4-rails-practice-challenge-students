class Student < ApplicationRecord
    belongs_to :instructor
    validates :name, presence: true
    validates :age, numerically: {greater_than: 18}
end
