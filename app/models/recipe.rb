class Recipe < ApplicationRecord
    
    belongs_to :user

	has_many :ingredients, inverse_of: :recipe, dependent: :destroy
	has_many :directions, inverse_of: :recipe, dependent: :destroy


  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true

    validates_presence_of :title, :description, :image

	has_attached_file :image, styles: { :medium => "400x400#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
