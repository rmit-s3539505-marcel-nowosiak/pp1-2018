class MatchesController < ApplicationController

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  def create
    @match = Match.new(match_params)
    @match.save
  end

  # PATCH/PUT /matches/1
  def update
    if @match.update(match_params)
      redirect_to @match, notice: 'Match was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /matches/1
  def destroy
    @match.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def match_params
      params.fetch(:match, {})
    end
end
