n = 3
puts "Dodawanie Modulo #{n}"
(0..n-1).each do |i|
  (0..n-1).each do |j|
    puts "#{i} + #{j} % #{n} = #{(i+j) % n}"
  end
end