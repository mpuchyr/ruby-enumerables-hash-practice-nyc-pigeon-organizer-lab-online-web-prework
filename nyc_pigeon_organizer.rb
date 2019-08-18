def nyc_pigeon_organizer(data)
  pigeon_names = []
  final_pigeon_list = {}
  counter = 0
  
  data.reduce({}) do |memo, (key, value)|
    value.reduce({}) do |memo2, (key2, value2)|
      value2.each do |item|
        pigeon_names.push(item)
      end
    end
  end
  
  pigeon_names = pigeon_names.uniq
  
  pigeon_names.each do |pigeon|
    final_pigeon_list[pigeon] = {
      :color => [],
      :gender => [],
      :lives => []
    }
  end
end
