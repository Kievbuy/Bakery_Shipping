@packs = {
  "VS5"=> {
    3=> 6.99,
    5=> 8.99
  },
  "MB11"=> {
    2=> 9.95,
    5=> 16.95,
    8=> 24.95
  },
  "CF"=> {
    3=> 5.95,
    5=> 9.95,
    9=> 16.99
  }
}

def order
  print "Please, enter order details: "
  str = gets.strip.upcase
  
  ord = str.split(' ')
  
  my_keys = @packs[ord[1]].keys
  variants = my_keys.size
  
  vars = []
  
  variants.downto(0) do |x|
    p_keys = @packs[ord[1]].keys
    p_keys.reverse!
    q = ord[0].to_i
    
    delivery = {}
    
    p_keys.delete_at(x)
    
    p_keys.each do |i|
        num = q / i
        delivery[i] = num
        q = q - (num * i)
      if q == 0
        break
      end
    end
    
    arr = []
    arr << q
    arr << delivery
    
    if arr[0] == 0
      vars << arr
    end
   
  end
  
  result = vars.first[1]
  total = 0
  
  result.each do |k, v|
    total = total + (@packs[ord[1]][k]) * v
  end
  
  total = total.round(2)
  
  puts "#{str} $ #{total}"
  result.each do |k, v|
    if v != 0
      puts "#{v} x #{k} $ #{(@packs[ord[1]][k])}"
    end
  end
end

order