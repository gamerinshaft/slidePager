class window.SlidePager
  constructor: (options) ->
    @$body  = $("body")
    @number = 1111
    @beforenumber = 1111
  shiftRight: ->
    @selectPanel("right")

  shiftLeft: ->
    @selectPanel("left")

  shiftUp: ->
    @selectPanel("up")

  shiftDown: ->
    @selectPanel("down")

  $dataname: (number)->
    return $("[data-js="+number+"]")

  isBack: (latestState) ->
    return @beforeState[@beforeState.length-1] == latestState

  selectPanel: (dir)->
    switch dir
      when "left"
        if parseInt((@number+ "").slice(0,1)) >= parseInt((@number+ "").slice(2,3))
          @movePanel(1000, dir)
        else
          @movePanel(-10, dir)
      when "up"
        if parseInt((@number+ "").slice(1,2)) >= parseInt((@number+ "").slice(3,4))
          @movePanel(100, dir)
        else
          @movePanel(-1, dir)
      when "right"
        if parseInt((@number+ "").slice(2,3)) >= parseInt((@number+ "").slice(0,1))
          @movePanel(10, dir)
        else
          @movePanel(-1000, dir)
      when "down"
        if parseInt((@number+ "").slice(3,4)) >= parseInt((@number+ "").slice(1,2))
          @movePanel(1, dir)
        else
          @movePanel(-100, dir)

  movePanel: (num, dir) ->
    if @$dataname(@number+num).hasClass("pages")
      e = $.Event( "transing" )
      $(window).trigger( e )
      @$dataname(@number).addClass("move"+dir).on "transitionend", =>
        @$dataname(@beforenumber).removeClass("active")
        @$dataname(@beforenumber).removeClass("move"+dir)
        e = $.Event( "transfinish" )
        $(window).trigger( e )
      @beforenumber = @number
      @number += num
      @$dataname(@number).addClass("active")


