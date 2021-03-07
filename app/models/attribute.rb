class Attribute < ApplicationRecord
  has_many :options, dependent: :destroy

  after_initialize :set_defaults, unless: :persisted?
  before_create :set_position

  attr_readonly :slug
  attr_readonly :count

  private

  def set_defaults
    self.slug = self.name.parameterize
    self.visible = false if self.visible.nil?
    self.variation = false if self.variation.nil?
  end

  def set_position
    last_position = Attribute.maximum(:position)
    self.position = last_position.to_i + 1
  end
end
