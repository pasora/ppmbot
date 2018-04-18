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
#   meigen add - 名言を追加します
#   meigen del - 最後の名言を削除します
#   meigen random - 名言を1つ返します
#   meigen list - 名言をすべて返します
#
# Notes:
#   NONE
#
# Author:
#   pasora

module.exports = (robot) ->
  robot.brain.autoSave = true

  robot.hear /^meigen\s+add\s+(.+)$/, (msg) ->
    meigen = robot.brain.get("meigen") || []
    meigen.push(msg.match[1])
    robot.brain.set("meigen", meigen)

  robot.hear /^meigen\s+del$/, (msg) ->
    meigen = robot.brain.get("meigen") || []
    msg.send "deleted: #{meigen.pop()}"
    robot.brain.set("meigen", meigen)

  robot.hear /^meigen\s+list$/i, (msg) ->
    meigen = robot.brain.get("meigen") || []
    msg.send ":writing_hand: 名言集 :writing_hand:"
    msg.send "#{meigen.join("\n")}"

  robot.hear /.*(名言|meigen\s+random).*/i, (msg) ->
    meigen = robot.brain.get("meigen") || []
    msg.send "#{meigen[Math.floor(Math.random()*meigen.length)]}"

