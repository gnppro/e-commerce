class Api::V1::OptionsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_option, only: %i[ show update destroy ]

  # GET /options
  def index
    @options = Option.all
    render json: @options, status: :ok
  end

  # GET /options/:uuid
  def show
    render json: @option, status: :ok
  end

  # POST /options
  def create
    @option = Option.new(option_params)

    if @option.save
      render json: @option, status: :created
    else
      render json: @option.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /options/:uuid
  def update
    if @option.update(option_params)
      render json: @option, status: :ok
    else
      render json: @option.errors, status: :unprocessable_entity
    end
  end

  # DELETE /options/:uuid
  def destroy
    @option.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_option
    @option = Option.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def option_params
    params.require(:option).permit(
      :attribute_id,
      :name,
      :description,
      :order,
    )
  end
end
