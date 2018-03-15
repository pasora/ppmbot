# Description:
#  Show the price of cryptocurrency 
#
# Dependencies:
#   NONE
#
# Configuration:
#   NONE
#
# Commands:
#   hubot crypto btc [country code from ISO4217]
#
# Notes:
#   NONE
#
# Author:
#   pasora

module.exports = (robot) ->

  robot.respond /crypto btc (.*)/i, (msg) ->
    currency = msg.match[1].toUpperCase()
    robot.http("https://blockchain.info/ja/ticker")
      .get() (err, res, body) ->
        json = JSON.parse(body)
        try
          price = json[currency]['last']
          msg.send ":bitcoin: -> #{currency}"
          msg.send "#{price}"
          msg.send "Source: www.blockchain.com"
        catch error
          msg.send "Unknown currency: #{currency}"

