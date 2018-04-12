class Api::V1::PlayersController < ApplicationController

  def index
    result = GetPlayerList.call(player_list_param)
    if result.success?
      players = Player.where("sport_id = ?", params[:sport_id])
     # j = players.count()
      render json: ActiveModel::Serializer::CollectionSerializer.new(players, serializer: Api::V1::PlayerSerializer, root: false).to_json, status: :ok
    else
      render json: result.message, status: :unprocessable_entity
    end
  end

  def show
    result = GetPlayerList.call()
    if result.success?
      player = Player.find(params[:id])
      render json:  Api::V1::PlayerSerializer.new(player, root: false).to_json
    else
      render json: result.message, status: :unprocessable_entity
    end
  end

  private

  def initialize_players
    Player.initialize_players_table
  end

  def player_list_param
    params.permit(:store_id)
  end

end
