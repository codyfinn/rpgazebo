class BaseAttributesController < ApplicationController
  before_action :set_base_attribute, only: [:show, :edit, :update, :destroy]

  # GET /base_attributes
  # GET /base_attributes.json
  def index
    @base_attributes = BaseAttribute.all
  end

  # GET /base_attributes/1
  # GET /base_attributes/1.json
  def show
  end

  # GET /base_attributes/new
  def new
    @base_attribute = BaseAttribute.new
  end

  # GET /base_attributes/1/edit
  def edit
  end

  # POST /base_attributes
  # POST /base_attributes.json
  def create
    @base_attribute = RuleSet.find_by(id: params[:base_attribute][:rule_set_id]).base_attributes.build(base_attribute_params)

    respond_to do |format|
      if @base_attribute.save
        format.html { redirect_to @base_attribute, notice: 'Base attribute was successfully created.' }
        format.json { render :show, status: :created, location: @base_attribute }
      else
        format.html { render :new }
        format.json { render json: @base_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /base_attributes/1
  # PATCH/PUT /base_attributes/1.json
  def update
    respond_to do |format|
      if @base_attribute.update(base_attribute_params)
        format.html { redirect_to @base_attribute, notice: 'Base attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @base_attribute }
      else
        format.html { render :edit }
        format.json { render json: @base_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /base_attributes/1
  # DELETE /base_attributes/1.json
  def destroy
    @base_attribute.destroy
    respond_to do |format|
      format.html { redirect_to base_attributes_url, notice: 'Base attribute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_base_attribute
      @base_attribute = BaseAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def base_attribute_params
      params.require(:base_attribute).permit(:name, :description, :rule_set_id)
    end
end
