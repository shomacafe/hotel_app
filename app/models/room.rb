class Room < ApplicationRecord
    mount_uploader :picture, ImageUploader
    belongs_to :user
    has_many :reservations

    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, numericality: true, presence: true
    validates :adress, presence: true
    validates :picture, presence: true
    
end
