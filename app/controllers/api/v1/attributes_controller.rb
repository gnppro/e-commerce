class Api::V1::AttributesController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_attribute, only: %i[ show update destroy ]

  # GET /attributes
  def index
    @attributes = Attribute.all
    render json: @attributes, status: :ok
  end

  # GET /attributes/:uuid
  def show
    render json: @attribute, status: :ok
  end

  # POST /attributes
  def create
    @attribute = Attribute.new(attribute_params)

    if @attribute.save
      render json: @attribute, status: :created
    else
      render json: @attribute.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /attributes/:uuid
  def update
    if @attribute.update(attribute_params)
      render json: @attribute, status: :ok
    else
      render json: @attribute.errors, status: :unprocessable_entity
    end
  end

  # DELETE /attributes/:uuid
  def destroy
    @attribute.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attribute
    @attribute = Attribute.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def attribute_params
    params.require(:attribute).permit(
      :name,
      :slug,
      :component,
      :position,
      :visible,
      :variation,
      :options_order_by,
      :options => [:name, :order],
    )
  end
end
