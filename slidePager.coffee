class window.SlidePager
  constructor: (options) ->
    @$body  = $("body")
    @number = 1111
    @beforeState  = []
  shiftLeft: ->
    if @isBack("right")
      @number -= 100
      @beforeState.pop()
    else
      @number += 1000
      @beforeState.push "left"
    @$dataname(@number).addClass("none")
    @$body.html(@beforeState)
  shiftRight: ->
    if @isBack("left")
      @number -= 1000
      @beforeState.pop()
    else
      @number += 100
      @beforeState.push "right"
    @$dataname(@number).addClass("none")
    @$body.html(@beforeState)
  shiftUp: ->
    if @isBack("down")
      @number -= 1
      @beforeState.pop()
    else
      @number += 10
      @beforeState.push "up"
    @$dataname(@number).addClass("none")
    @$body.html(@beforeState)
  shiftDown: ->
    if @isBack("up")
      @number -= 10
      @beforeState.pop()
    else
      @number += 1
      @beforeState.push "down"
    @$dataname(@number).addClass("none")
    @$body.html(@beforeState)

  $dataname: (number)->
    return $("[data-js="+number+"]")

  isBack: (latestState) ->
    return @beforeState[@beforeState.length-1] == latestState

