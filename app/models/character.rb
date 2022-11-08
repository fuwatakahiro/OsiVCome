class Character < ApplicationRecord
  has_one_attached :character_image
  
  def get_character_image(width, height)
    unless character_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      character_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    else
        character_image.variant(resize_to_fill: [width, height], gravity: :center).processed
    end
  end
end
