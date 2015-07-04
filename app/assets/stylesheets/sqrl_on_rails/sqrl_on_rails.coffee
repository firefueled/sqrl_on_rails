@SqrlLoginPoller =
  poll: ->
    setTimeout @request, 2000

  request: ->
    $.get('/am_loggedin', { 'session_id': session['session_id'] },
      (data) ->
        alert JSON.stringify data
    )

$ ->
  SqrlLoginPoller.poll()