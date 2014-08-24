class window.SlidePager
  constructor: (options) ->
    @$body  = $("body")
    @number = 1111
    @beforeState  = []

  shiftRight: ->
    @mover("right","left")

  shiftLeft: ->
    @mover("left","right")

  shiftUp: ->
    @mover("up","down")

  shiftDown: ->
    @mover("down","up")

  $dataname: (number)->
    return $("[data-js="+number+"]")

  isBack: (latestState) ->
    return @beforeState[@beforeState.length-1] == latestState

  mover: (op1, op2)->

    if @isBack(op2)
      switch op2
        when "up"
          @removeposition(op2, 10)
        when "down"
          @removeposition(op2, 1)
        when "left"
          @removeposition(op2, 1000)
        when "right"
          @removeposition(op2, 100)
      @beforeState.pop()
    else
      switch op1
        when "up"
          if @$dataname(@number+10).hasClass("pages")
            @removeactive(op1, 10)
            @number += 10
            @$dataname(@number).addClass("active")
            @beforeState.push op1
        when "down"
          if @$dataname(@number+1).hasClass("pages")
            @removeactive(op1, 1)
            @number += 1
            @$dataname(@number).addClass("active")
            @beforeState.push op1
        when "left"
          if @$dataname(@number+1000).hasClass("pages")
            @removeactive(op1, 1000)
            @number += 1000
            @$dataname(@number).addClass("active")
            @beforeState.push op1
        when "right"
          if @$dataname(@number+100).hasClass("pages")
            @removeactive(op1, 100)
            @number += 100
            @$dataname(@number).addClass("active")
            @beforeState.push op1

  removeactive: (op1, num)->
    @$dataname(@number).addClass("move"+op1).on "transitionend", =>
      @$dataname(@number-num).removeClass("active")

  removeposition: (op2, num)->
    @number -= num
    @$dataname(@number+num).css
      'z-index':'1'
    @$dataname(@number).addClass("active")
    @$dataname(@number).removeClass("move"+op2).on "transitionend", =>
      @$dataname(@number+num).removeClass("active")
