require = __meteor_bootstrap__.require
spawn = require('child_process').spawn

Meteor.methods
  pandoc: (format, text) ->
    fut = new Future()
    p = spawn("pandoc", ['-t', format])
    p.stdout.on 'data', (data) ->
      fut.ret(data)
    p.stdin.write(text)
    p.stdin.end()
    fut.wait()
    fut.value.toString()

