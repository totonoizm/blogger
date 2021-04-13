class Blog < ApplicationRecord

  belongs_to :admin
  acts_as_taggable
  enum status: { draft: 0, published: 1 } #enumにて下書き判別ステータスを設定
  has_one_attached :image # サムネイル用
  has_rich_text :content

  validates :image, presence: true # dafault バリデーション
  validates :title, presence: true # dafault バリデーション
  validate :image_content_type, if: :was_attached? #カスタムバリデータ　自作メソッドを使用する = validate

  private
  def image_content_type
    extension = ['image/png', 'image/jpg', 'image/jpeg']
    errors.add(:image, "の拡張子が間違っています") unless image.content_type.in?(extension)
  end

  def was_attached?
    self.image.attached?
  end
end