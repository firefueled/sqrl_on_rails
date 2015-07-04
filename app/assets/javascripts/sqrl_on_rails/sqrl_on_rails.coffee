@SqrlLoginPoller =
  poll: ->
    setTimeout @request, 2000

  request: ->
    $.get('/am_loggedin', { 'nut': session['nut'] },
      (data) ->
        alert JSON.stringify data
    )

$ ->
  SqrlLoginPoller.poll()