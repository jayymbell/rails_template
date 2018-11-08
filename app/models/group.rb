class Group < ApplicationRecord
    validates :name, :presence => true, uniqueness: {case_sensitive: false}

    has_and_belongs_to_many :users
    has_and_belongs_to_many :permissions
end
