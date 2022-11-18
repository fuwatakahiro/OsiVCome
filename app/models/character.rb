class Character < ApplicationRecord
  validates :name,presence: true
  validates :greeting,presence: true
  validates :genre,presence: true
  validates :reference_destination,presence: true
  validates :character_image,presence: true
  has_one_attached :character_image
  has_many :comments, dependent: :destroy

  def get_character_image(width, height)
    unless character_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      character_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    character_image.variant(resize_to_fill: [width, height], gravity: :center).processed
  end
  def self.search_for(content)
    Character.where("name LIKE?", "%#{content}%")
  end
end
