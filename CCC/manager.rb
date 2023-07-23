require "uri"
require "net/http"
require "json"
require "./coin"
class Manager
    @@repo = {}
    def initilize 
        initilize_repo  
    end

    def initilize_repo
        response = web
        json = JSON.parse(response)
        for symbol, values in json
            coin = Coin.new(symbol, values['USD'], values['EUR'])
            @@repo[symbol] = coin
        end
    end

    def web
        url = "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,XRP,DASH,LTC,ETH&tsyms=USD,EUR"
        uri = URI(url)
        Net::HTTP.get(uri)
    end

    def coin_list
        @@repo.keys
    end

    def calculate(amount, symbol, to)
        coin = @@repo[symbol]
        amount*coin.send(to.to_sym)
    end
end
