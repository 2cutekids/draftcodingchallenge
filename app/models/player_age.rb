class PlayerAge

  class << self
    attr_reader :position_ages_by_sport
  end


  @position_ages_by_sport = Hash.new

  def self.create_player_age_list(obj)
    obj.each do |player|
      @position_ages_by_sport[player["sport_id"]] ||= Hash.new()
      @position_ages_by_sport[player["sport_id"]][player["position"]] = Array.new if (position_ages_by_sport[player["sport_id"]])[player["position"]].blank?
      (@position_ages_by_sport[player["sport_id"]])[player["position"]] << player["age"]
    end

  end


end