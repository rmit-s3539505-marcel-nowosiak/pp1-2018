class EmploymentsController < ApplicationController
  before_action :set_employment, only: [:show, :edit, :update, :destroy]

  # GET /employments
  def index
    @employments = Employment.all
  end

  # GET /employments/1
  def show
  end

  # GET /employments/new
  def new
    @employment = Employment.new
  end

  # GET /employments/1/edit
  def edit
  end

  # POST /employments
  def create
    @employment = Employment.new(employment_params)

    if @employment.save
      redirect_to @employment, notice: 'Employment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /employments/1
  def update
    if @employment.update(employment_params)
      redirect_to @employment, notice: 'Employment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /employments/1
  def destroy
    @employment.destroy
    redirect_to employments_url, notice: 'Employment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employment
      @employment = Employment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def employment_params
      params.fetch(:employment, {})
    end
end
