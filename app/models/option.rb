class Option < ApplicationRecord
  # belongs_to :attribute # activerecord method
  belongs_to :product_attribute, foreign_key: 'attribute_id', class_name: 'Attribute'
  after_initialize :set_defaults, unless: :persisted?
  before_create :set_order

  private

  def set_defaults
    self.slug = self.name.parameterize
  end

  def set_order
    order = Option.maximum(:order)
    self.order = order.to_i + 1
  end
end
