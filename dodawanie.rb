puts "Dodawanie Modulo 2"
(0..2).each do |i|
  (0..2).each do |j|
    puts "#{i} + #{j} % 2 = #{(i+j) % 2}"
  end
end