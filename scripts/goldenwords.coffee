# Description:
#   static reply template from the kuso animation
#
# Dependencies:
#   NONE
#
# Configuration:
#   NONE
#
# Commands:
#   hubot 名言 - 名言を返します
#
# Notes:
#   NONE
#
# Author:
#   pasora

module.exports = (robot) ->

  robot.respond /名言/i, (msg) ->
    msg.send msg.random ["え、ブルーバックス読めばできんの?","Mr. RGRじゃねえよ","未来を見据えてた","なんでiPhoneにしないの?"]
