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
#   hubot エイサーイ - "ハラマスコーイ"
#   hubot ハラマスコーイ - link to the kuso manga
#
# Notes:
#   NONE
#
# Author:
#   pasora

module.exports = (robot) ->

  robot.respond /エイサーイ/i, (msg) ->
    msg.send "ハラマスコーイ"

  robot.respond /ハラマスコーイ/i, (msg) ->
    msg.send "http://mangalifewin.takeshobo.co.jp/rensai/popute/popute-015/15112/"

