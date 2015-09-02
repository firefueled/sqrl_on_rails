@SqrlLoginPoller =
  poll: ->
    setTimeout @request, 2000

  request: ->
    console.debug 'requesting...'
    $.ajax(url: '/am_loggedin', method: 'get', timeout: 4000)
      .done (data) ->
        console.debug JSON.stringify data
        
        if data? and data.msg == 'yep'
          @login
        
        console.debug 'retasrting...'
        @poll
      .fail (data) ->
        return  @poll

  login: ->
    alert 'youre logged in'

$ ->
  SqrlLoginPoller.poll()