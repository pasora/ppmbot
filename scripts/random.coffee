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
#   random word... - どれかひとつ返します
#
# Notes:
#   NONE
#
# Author:
#   pasora

module.exports = (robot) ->
  robot.brain.autoSave = true

  robot.respond /random\s+(.+)$/, (msg) ->
    list = msg.match[1].split(" ")
    msg.send "#{list[Math.floor(Math.random()*list.length)]}"

