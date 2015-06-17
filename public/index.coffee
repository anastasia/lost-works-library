app = angular.module('app', [])
app.controller 'MainCtrl', ->
  ctrl = this
  currentSlide = 0
  slideElements = []

  elements = [
      type           : 'text'
      value          : 'slide 1 only'
      in             : 1
      out            : 2
      top            : 50
      left           : 200
      transition_in  : 'slide'
      duration_in    : '1500'
      layer          : 1
    ,
      type           : 'text'
      value          : 'slides 2-3'
      in             : 2
      out            : 4
      layer          : 1
    ,
      type           : 'image'
      value          : 'http://placehold.it/350x150/ffcccc/ffffff&text=1-3'
      in             : 1
      out            : 4
      top            : 50
      left           : 50
      transition_out : 'slide'
      layer          : 3
    ,
      type           : 'image'
      value          : "http://placehold.it/100x100&text=2"
      in             : 2
      out            : 3
      top            : 50
      left           : 50
      transition_out : 'slide-up'
      layer          : 2

  ]

  ctrl.elements = elements
  ctrl.frameNumbers = [1,2,3,4,5,6,7,8,9,10]
  ctrl.transitions = ['fade', 'slide', 'slide-up']


  generateElements = (elementList) ->
    renderedElements = []
    for el in elementList
      elem = $('<div class="stack-element">')

      if el.type == 'text'
        child = $('<div class="content">').text(el.value)
      else
        child = $('<img class="content">').attr 'src', el.value

      elem.append child

      elem.data('in', el.in)
      elem.data('out', el.out)
      elem.data('layer', el.layer)


      transitionIn  = el.transition_in  || 'fade'
      transitionOut = el.transition_out || 'fade'
      durationIn    = el.duration_in    || 300
      delayIn       = el.delay_in       || 0

      elem.addClass 'transition-in-'  + transitionIn
      elem.addClass 'transition-out-' + transitionOut
      elem.addClass 'duration-in-'    + durationIn
      elem.addClass 'delay-in-'       + delayIn

      if el.top
        css =
          position : 'absolute'
          top      : el.top
          left     : el.left
        elem.find('.content').css(css)

      renderedElements.push elem

    $('#Stack #layer-1').append _(renderedElements).filter (el) -> el.data('layer') == 1
    $('#Stack #layer-2').append _(renderedElements).filter (el) -> el.data('layer') == 2
    $('#Stack #layer-3').append _(renderedElements).filter (el) -> el.data('layer') == 3

    slideElements = $('#Stack .layer').children()

  renderTimeline = ->
    layers = $('#Timeline .timeline-row .layer')
    for el in elements
      inNum = el.in
      outNum = el.out
      lengthNum = outNum - inNum
      asset = $('<div class="asset">').text el.value
      asset.css 'width', lengthNum * 80
      asset.css 'left', inNum * 80

      $(layers[el.layer - 1]).append asset

  this.goBack = ->
    go(currentSlide, currentSlide-1)

  this.goNext = ->
    go(currentSlide, currentSlide+1)

  go = (from,to) ->
    to = Math.min elements.length, Math.max(0, to)

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

  generateElements(elements)
  go(0,0)
  renderTimeline()
