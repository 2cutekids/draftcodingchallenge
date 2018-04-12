class Api::V1::PlayerSerializer < ActiveModel::Serializer
  attributes :id, :position, :age

  attribute :average_position_age_diff do
    @object.position_age_average_difference
  end

  attribute :first_name do
    @object.firstname
  end

  attribute :last_name do
    @object.lastname
  end

  attribute  :name_brief do
    @object.get_brief_name
  end
end
