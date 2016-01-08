# Description
#   A replacement for Todd
#
# Configuration:
#
# Commands:
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   Joe Ennever <joe@dwnld.me>

Octokat = require('octokat')


module.exports = (robot) ->
  octo = new Octokat(token: process.env.SLACK_TODDBOT_GITHUB_TOKEN)
  robot.router.post '/hubot/pull-request', (req, res) ->
    body = if req.body.payload? then JSON.parse req.body.payload else req.body
    if body.action == 'opened'
      octo.repos('dwnld', 'jnsq_server').issues(body.pull_request.number).comments.create(body: "Specs")
    res.send 'OK'
