class GetPlayerList
  include Interactor

  def call

    initialize_players_table(context.sport_id)

    if context.fail?
      context.fail!(message: @message)
    end
  end

private
  def does_player_table_exist?
    ActiveRecord::Base.connection.table_exists?('players')
  end

  #check if we need to reload player table.
  def do_we_need_reload_from_cbs_sports?
    does_player_table_exist? && Player.count == 0
  end

  #In order to retrieve new cbs_api just empty player table next
  # time api is requested it will reload or when system starts up.
  # I woould suggest bring down rails, emptying the table and restarting app, otherwise api csll may take to long an fail
public
  def initialize_players_table(sports_id)
    if do_we_need_reload_from_cbs_sports?
      begin
        Sport.all.each do |activity|
          sport = activity
          response = RestClient.get("https://api.cbssports.com/fantasy/players/list?version=3.0&SPORT=#{sport.name}&response_format=JSON")
          list = JSON.parse(response)
          player_list = list['body']['players']
          player_list.map! do |obj|
              obj.keep_if{|k,v| Player.attribute_names.include?(k) }
              obj['sport_id'] = activity.id
              obj
          end
          Player.create(player_list)
        end
      rescue RuntimeError=> e
        @message = "Error #{e.response()}"
        context.fail!(message: @message)
      rescue
        raise
      end
    end
    if does_player_table_exist? && (PlayerAge.position_ages_by_sport.blank? ||\
     (sports_id && PlayerAge.position_ages_by_sport[sports_id].blank?))
      PlayerAge.create_player_age_list(sports_id ? Player.where("sport_id = ?", sports_id) : Player.all)
    end
  end
end