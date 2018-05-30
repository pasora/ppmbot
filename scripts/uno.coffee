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

    rank = 1
    for player in uno
      if rank == 1
        message += ":first_place_medal: #{player.name}	point: #{player.point}	win: #{player.win}\n"
        rank++
      else if rank == 2
        message += ":second_place_medal: #{player.name}	point: #{player.point}	win: #{player.win}\n"
        rank++
      else if rank == 3
        message += ":third_place_medal: #{player.name}	point: #{player.point}	win: #{player.win}\n"
        rank++
      else
        message += "#{rank}	#{player.name}	point: #{player.point}	win: #{player.win}\n"
        rank++

    msg.send message

