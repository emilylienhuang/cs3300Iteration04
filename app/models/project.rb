class Project < ApplicationRecord
    validates :title, presence: true
    validates_presence_of :title, :description
end
