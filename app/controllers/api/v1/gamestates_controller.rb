class Api::V1::GamestatesController < ApplicationController

  def create
    @gamestate = Gamestate.new(gamestate_params)

    if @gamestate.save
      render json: { gamestate: @gamestate }, status: :created
    else
      render json: { error: 'failed to create gamestate' }, status: :not_acceptable
    end
  end

  def destroy
    if Gamestate.destroy(params[:id])
      render json: {destroyed: true}
    else
      render json: {destroyed: false}
    end
  end

  def update
    Gamestate.find(params[:id]).update(gamestate_params)
    render json: { gamestate: Gamestate.find(params[:id]) }
  end

  private

  def gamestate_params
    params.require(:gamestate).permit(:company_name, :cash, :luck, :karma, :heat, :streetcred, :xships, :ship_lvl, :xmercs, :user_id, :savename)
  end

end
