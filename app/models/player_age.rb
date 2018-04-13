class PlayerAge

  class << self
    attr_reader :position_ages_by_sport
  end

  def self.initialize_position_ages_by_sport
    @position_ages_by_sport = Hash.new
  end

  def create_player_age_list(sports_id)
    if self.class.do_we_need_to_build_list?(sports_id)
      ages = self.class.position_ages_by_sport
      obj = sports_id ? Player.where("sport_id = ?", sports_id) : Player.all
      obj.each do |player|
        ages[player["sport_id"]] ||= Hash.new()
        ages[player["sport_id"]][player["position"]] = Array.new if (ages[player["sport_id"]])[player["position"]].blank?
        (ages[player["sport_id"]])[player["position"]] << player["age"]
      end
    end
  end

  def self.do_we_need_to_build_list?(sports_id=nil)
    (position_ages_by_sport.blank? ||
     (sports_id && position_ages_by_sport[sports_id].blank?))
  end

  self.initialize_position_ages_by_sport

end