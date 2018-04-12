class Player < ApplicationRecord

  Sports = [
            ['basketball', 1],
            ['baseball', 2],
            ['football', 3]
  ]

  validates :firstname, length: { minimum: 1 }
  validates :lastname, length: { minimum: 1 }
  validates :age, numericality: {only_integer: true, greater_than: 0}
  validates :position, presence:true, length: { minimum: 1}
  belongs_to :sport

  def self.default_scope
    order(:lastname, :firstname)
  end

   def get_brief_name
    case  self.sport.name
    when 'football'
      "#{self.firstname[0]}. #{self.lastname}"
    when 'basketball'
      "#{self.firstname} #{self.lastname[0]}."
    when 'baseball'
      "#{self.firstname[0]}. #{self.lastname[0]}."
    end
  end

  def position_age_average_difference
    arr = PlayerAge.position_ages_by_sport[self.sport.id][self.position]
    avg_position_age = Integer(arr.sum / arr.count)
    self.age - avg_position_age
  end
end

