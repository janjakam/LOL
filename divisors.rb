(1..10).each do |n|
 puts
  puts "Divisors of #{n}"
  a = []
  (1..n).each do |d|
    a << d if (n % d == 0)
  end
  puts a.inspect
  puts "found #{a.length} divisors"
end