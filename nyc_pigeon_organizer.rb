def nyc_pigeon_organizer(data)
  pigeon_names = []
  final_pigeon_list = {}
  counter = 0
  
  #extracts the names of each individual pigeon
  data.reduce({}) do |memo, (key, value)|
    value.reduce({}) do |memo2, (key2, value2)|
      value2.each do |item|
        pigeon_names.push(item)
      end
    end
  end
  
  pigeon_names = pigeon_names.uniq
  
  #sets up the key, value pairs of the final hash
  pigeon_names.each do |pigeon|
    final_pigeon_list[pigeon] = {
      :color => [],
      :gender => [],
      :lives => []
    }
  end
  

  final_pigeon_list.reduce({}) do |p_memo, (p_key, p_value)|
    data.reduce({}) do |d_memo, (d_key, d_value)|
        d_value.reduce({}) do |dv_memo, (dv_key, dv_value)|
            if dv_value.include?(p_key)
                p_value[d_key].push(dv_key.to_s)
            end
        end
    end
  end
  
  final_pigeon_list
end
