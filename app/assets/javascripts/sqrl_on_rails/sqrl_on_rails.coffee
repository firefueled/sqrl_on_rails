@SqrlLoginPoller =
  poll: ->
    setTimeout @request, 2000

  request: ->
    console.debug SqrlLoginPoller.parse_nut()

    $.ajax(url: '/am_loggedin', method: 'get', data: {nut: SqrlLoginPoller.parse_nut()}, timeout: 4000)
      .done (data) ->
        if data? and data.msg == 'yep'
          return SqrlLoginPoller.login()
        
        SqrlLoginPoller.poll()
      .fail (data) ->
        return SqrlLoginPoller.poll()

  parse_nut: ->
    return @nut if @nut

    nut = document.cookie.match(/nut=([\w-_]+);?/)
    nut = nut[1] if nut.length >= 2 and nut[1]

    @nut = nut

  login: ->
    alert 'youre logged in'

$ ->
  SqrlLoginPoller.poll()