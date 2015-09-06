@SqrlLoginPoller =
  poll: ->
    setTimeout @request, 2000

  request: ->
    console.debug 'requesting...'
    $.ajax(url: '/am_loggedin', method: 'get', timeout: 4000)
      .done (data) ->
        console.debug JSON.stringify data
        
        if data? and data.msg == 'yep'
          SqrlLoginPoller.login()
        
        console.debug 'retasrting...'
        SqrlLoginPoller.poll()
      .fail (data) ->
        return SqrlLoginPoller.poll()

  login: ->
    alert 'youre logged in'

$ ->
  SqrlLoginPoller.poll()