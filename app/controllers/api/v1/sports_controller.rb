class Api::V1::SportsController < ApplicationController
  def index
    begin
      sports = Sport.all
      render json: ActiveModel::Serializer::CollectionSerializer.new(sports, serializer: SportSerializer, root: false).to_json,status: :ok
    rescue Exception => e
      render json: e.message, status: :unprocessable_entity
    end
  end
end
