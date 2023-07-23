require "./manager"

def menu
    manager = Manager.new
    loop do
        puts "CryptoCurrency Convertor"
        puts "a) Convert to USD"
        puts "b) Convert to EUR"
        puts "q) QUIT"

        choice = gets.chomp
        case choice
        when "a"
            coin_list = manager.coin_list
            puts "Available Coins"
            puts coin_list
            puts coin_list.join(", ").center(50,"-")
            print "Coin: "
            symbol = gets.chomp.upcase
            print = "Amount: "
            amount = gets.chomp.to_i

            if coin_list.include? symbol
                result = manager.calculate(amount, symbol, "USD")
                puts " - ".center(50, "-")
                puts "#{amount} #{symbol} = #{result} USD".center(50, "-")
                puts "-".center(50,"-")
            else 
                puts "#{symbol} is not available.".center(50, "*")
            end
        end

        break unless choice != "q"
    end
end
menu()