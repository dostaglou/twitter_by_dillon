class Tweet < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :content, length: { maximum: 140 }
  has_ancestry
end
