# Description:
#   ranking function for uno player
#
# Dependencies:
#   NONE
#
# Configuration:
#   NONE
#
# Commands:
#   uno @user [point] - @user に [point] 点を追加します
#   uno clear - これまでの得点をすべてクリアします
#   uno list - これまでの得点を高い順に表示します
#
# Notes:
#   NONE
#
# Author:
#   pasora

module.exports = (robot) ->
  robot.brain.autoSave = true

  robot.hear /^uno\s+(.*)\s+([1-9][0-9]*)$/, (msg) ->
    uno = robot.brain.get("uno") || []
    for player in uno
      if player.name == msg.match[1]
        player.point += parseInt(msg.match[2], 10)
        player.win += 1
        robot.brain.set("uno", uno)
        return
    new_player = {"name":"#{msg.match[1]}", "point":parseInt(msg.match[2]), "win":1}
    uno.push(new_player)
    robot.brain.set("uno", uno)

  robot.hear /^uno\s+clear$/, (msg) ->
    uno = []
    robot.brain.set("uno", uno)

  robot.hear /^uno\s+list$/i, (msg) ->
    uno = robot.brain.get("uno") || []

    sortPoint = (a, b) -> b.point - a.point

    uno.sort sortPoint

    message = ""

    for player, index in uno
      rank = index + 1
      if rank == 1
        message += ":first_place_medal:\t#{player.name}\tpoint:\t#{player.point}\twin:\t#{player.win}\n"
      else if rank == 2
        message += ":second_place_medal:\t#{player.name}\tpoint:\t#{player.point}\twin:\t#{player.win}\n"
      else if rank == 3
        message += ":third_place_medal:\t#{player.name}\tpoint:\t#{player.point}\twin:\t#{player.win}\n"
      else
        message += "#{rank}\t#{player.name}\tpoint:\t#{player.point}\twin:\t#{player.win}\n"

    msg.send message

