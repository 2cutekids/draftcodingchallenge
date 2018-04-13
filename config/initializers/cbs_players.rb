begin
  if ActiveRecord::Base.connection.table_exists?("sports")  && Sport.count == 0
      Player::Sports.each do |sport|
         Sport.find_or_create_by(name: sport[0]) {  |activity| activity.id = sport[1] }
      end
  end
  result = GetPlayerList.call()
  unless result.success?
    abort result.message
  end
rescue RuntimeError =>e
  abort e.to_s
end

