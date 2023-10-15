add = lambda do |n1,n2|
    n1+n2
end

subtract = lambda do |n1,n2|
    n1-n2
end

multiply = lambda do |n1,n2|
    n1*n2
end

divide = lambda do |n1,n2|
    n1/n2
end

def calc(event)
    print 'Enter n1: '
    n1 =gets.chomp.to_i
    print 'Enter n2: '
    n2 =gets.chomp.to_i
    result = event.call(n1,n2)
    puts "Result is #{result}"
end

begin 
puts 'Welcome, Calculator !'
puts 'a is +'
puts 'b is -'
puts 'c is *'
puts 'd is /'
puts 'q is quit'
puts  'a/b/c/d/q '
sign = gets.chomp
case sign 
when 'a' then calc add
when 'b' then calc subtract
when 'c' then calc multiply
when 'd' then calc divide
end
end while sign !='q'