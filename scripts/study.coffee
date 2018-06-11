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
#   study add - 勉強したいことを追加します
#   study del - 最後の勉強したいことを削除します
#   study random - 勉強したいことを1つ返します
#   study list - 勉強したいことをすべて返します
#
# Notes:
#   NONE
#
# Author:
#   pasora

module.exports = (robot) ->
  robot.brain.autoSave = true

  robot.hear /^study\s+add\s+(.+)$/, (msg) ->
    study = robot.brain.get("study") || []
    study.push(msg.match[1])
    robot.brain.set("study", study)

  robot.hear /^study\s+del$/, (msg) ->
    study = robot.brain.get("study") || []
    msg.send "deleted: #{study.pop()}"
    robot.brain.set("study", study)

  robot.hear /^study\s+poll$/i, (msg) ->
    study = robot.brain.get("study") || []
    message = '/poll "Which theme do you want to study?" "'
    message += "#{study.join('" "')}"
    message += '"'
    msg.send message

  robot.hear /^study\s+list$/i, (msg) ->
    study = robot.brain.get("study") || []
    msg.send "#{study.join("\n")}"

  robot.hear /.*study\s+random.*/i, (msg) ->
    study = robot.brain.get("study") || []
    msg.send "#{study[Math.floor(Math.random()*study.length)]}"

