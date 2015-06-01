app = angular.module('app', [])
app.controller 'MainCtrl', ->
  ctrl = this
  currentSlide = 0
  slideElements = $('#Stack').children()

  this.goBack = ->
    go(currentSlide, currentSlide-1)

  this.goNext = ->
    go(currentSlide, currentSlide+1)

  go = (from,to) ->
    # only allow slides 0-4
    to = Math.min 4, Math.max(0, to)

    currentSlide = to
    ctrl.current = currentSlide

    $(slideElements).removeClass 'current next previous before after'
    for element in slideElements
      elem   = $(element)
      inNum  = elem.data 'in'
      outNum = elem.data 'out'

      if to > outNum
        elem.addClass 'before'
      else if to == outNum
        elem.addClass 'previous'
      else if to >= inNum && to < outNum
        elem.addClass 'current'
      else if to == inNum - 1
        elem.addClass 'next'
      else if to < inNum - 1
        elem.addClass 'after'

  go(0,0)

