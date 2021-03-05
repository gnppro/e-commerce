class Api::V1::ProductsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_product, only: %i[ show update destroy ]

  # GET /products
  def index
    @products = Product.all
    render json: @products, status: :ok
  end

  # GET /products/:uuid
  def show
    render json: @product, status: :ok
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/:uuid
  def update
    if @product.update(product_params)
      render json: @product, status: :ok
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/:uuid
  def destroy
    @product.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(
      :name,
      :slug,
      :description,
      :short_description,
      :sku,
      :regular_price,
      :sale_price,
      :price,
      :purchase_note,
      :weight,
      :external_url,
      :parent_id,
      :total_sales,
      :download_limit,
      :download_expiry,
      :stock_quantity,
      :rating_count,
      :menu_order,
      :average_rating,
      :featured,
      :on_sale,
      :purchasable,
      :virtual,
      :downloadable,
      :manage_stock,
      :backorders_allowed,
      :backordered,
      :sold_individually,
      :shipping_required,
      :reviews_allowed,
      :date_on_sale_from,
      :date_on_sale_from_gmt,
      :date_on_sale_to,
      :date_on_sale_to_gmt,
      :type,
      :status,
      :stock_status,
      :backorders,
      :meta_data,
      :related_ids,
      :upsell_ids,
      :cross_sell_ids,
      dimensions: [:w, :h, :l],
    )
  end
end
