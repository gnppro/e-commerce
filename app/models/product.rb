class Product < ApplicationRecord
  after_initialize :set_defaults, unless: :persisted?
  after_initialize :set_on_sale

  store :dimensions, accessors: [:w, :h, :l], coder: JSON

  attr_readonly :price
  attr_readonly :on_sale
  attr_readonly :purchasable
  attr_readonly :total_sales
  attr_readonly :backorders_allowed
  attr_readonly :backordered
  attr_readonly :shipping_required
  attr_readonly :average_rating
  attr_readonly :rating_count

  private

  def set_on_sale
    self.price = is_on_sale ? self.sale_price : self.regular_price
    self.on_sale = is_on_sale ? true : false
  end

  def set_defaults
    self.kind ||= 'simple'
    self.status ||= 'publish'
    self.stock_status ||= 'instock'
    self.backorders ||= 'no'
    self.featured = false if self.featured.nil?
    self.purchasable = false if self.purchasable.nil?
    self.virtual = false if self.virtual.nil?
    self.downloadable = false if self.downloadable.nil?
    self.manage_stock = false if self.manage_stock.nil?
    self.backorders_allowed = false if self.backorders_allowed.nil?
    self.backordered = false if self.backordered.nil?
    self.sold_individually = false if self.sold_individually.nil?
    self.shipping_required = false if self.shipping_required.nil?
    self.reviews_allowed = false if self.reviews_allowed.nil?
  end

  def is_on_sale
    if (self.date_on_sale_from.present? && self.date_on_sale_to.present?)
      current_time = Time.zone.now
      sale_from = Time.parse(self.date_on_sale_from.to_s)
      sale_to = Time.parse(self.date_on_sale_to.to_s)
      current_time >= sale_from && current_time <= sale_to ? true : false
    else
      false
    end
  end
end
