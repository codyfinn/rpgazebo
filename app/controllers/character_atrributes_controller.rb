class CharacterAtrributesController < ApplicationController
  before_action :set_character_atrribute, only: [:show, :edit, :update, :destroy]

  # GET /character_atrributes
  # GET /character_atrributes.json
  def index
    @character_atrributes = CharacterAtrribute.all
  end

  # GET /character_atrributes/1
  # GET /character_atrributes/1.json
  def show
  end

  # GET /character_atrributes/new
  def new
    @character_atrribute = CharacterAtrribute.new
  end

  # GET /character_atrributes/1/edit
  def edit
  end

  # POST /character_atrributes
  # POST /character_atrributes.json
  def create
    @character_atrribute = CharacterAtrribute.new(character_atrribute_params)

    respond_to do |format|
      if @character_atrribute.save
        format.html { redirect_to @character_atrribute, notice: 'Character atrribute was successfully created.' }
        format.json { render :show, status: :created, location: @character_atrribute }
      else
        format.html { render :new }
        format.json { render json: @character_atrribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_atrributes/1
  # PATCH/PUT /character_atrributes/1.json
  def update
    respond_to do |format|
      if @character_atrribute.update(character_atrribute_params)
        format.html { redirect_to @character_atrribute, notice: 'Character atrribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @character_atrribute }
      else
        format.html { render :edit }
        format.json { render json: @character_atrribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_atrributes/1
  # DELETE /character_atrributes/1.json
  def destroy
    @character_atrribute.destroy
    respond_to do |format|
      format.html { redirect_to character_atrributes_url, notice: 'Character atrribute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character_atrribute
      @character_atrribute = CharacterAtrribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_atrribute_params
      params.require(:character_atrribute).permit(:value, :modifier)
    end
end
