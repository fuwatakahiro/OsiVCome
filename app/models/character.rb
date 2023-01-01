class Character < ApplicationRecord
  validates :name,presence: true
  validates :greeting,presence: true
  validates :reference_destination,presence: true
  validates :character_image,presence: true
  validates :birth_day,presence: true
  validates :birth_month,presence: true
  has_one_attached :character_image
  has_many :comments, dependent: :destroy
  has_many :groups
  belongs_to :genre
#画像の大きさをrails側で行うため
  def get_character_image(width, height)
    character_image.variant(resize_to_fill: [width, height], gravity: :center).processed
  end
  #キャラクターの名前をあてにして探している
  def self.search_for(content)
    Character.where("name LIKE?", "%#{content}%")
  end
#キャラクター詳細の名前の横にアイコンをランダムで出すための
  def name_icon
    icon = ["人物アイコン (1).png","人物アイコン (2).png","人物アイコン (3).png","人物アイコン.png"]
    icon.sample
  end
end
