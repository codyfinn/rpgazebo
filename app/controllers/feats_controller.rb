class FeatsController < ApplicationController
  before_action :set_feat, only: [:show, :edit, :update, :destroy]

  # GET /feats
  # GET /feats.json
  def index
    @feats = Feat.all
  end

  # GET /feats/1
  # GET /feats/1.json
  def show
  end

  # GET /feats/new
  def new
    @feat = Feat.new
  end

  # GET /feats/1/edit
  def edit
  end

  # POST /feats
  # POST /feats.json
  def create
    @feat = RuleSet.find_by(id: params[:feat][:rule_set_id]).feats.build(feat_params)

    respond_to do |format|
      if @feat.save
        format.html { redirect_to @feat, notice: 'Feat was successfully created.' }
        format.json { render :show, status: :created, location: @feat }
      else
        format.html { render :new }
        format.json { render json: @feat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feats/1
  # PATCH/PUT /feats/1.json
  def update
    respond_to do |format|
      if @feat.update(feat_params)
        format.html { redirect_to @feat, notice: 'Feat was successfully updated.' }
        format.json { render :show, status: :ok, location: @feat }
      else
        format.html { render :edit }
        format.json { render json: @feat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feats/1
  # DELETE /feats/1.json
  def destroy
    @feat.destroy
    respond_to do |format|
      format.html { redirect_to feats_url, notice: 'Feat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feat
      @feat = Feat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feat_params
      params.require(:feat).permit(:name, :description, :rule_set_id)
    end
end
