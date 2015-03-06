define (require, exports, module)->
  _Page = require "../_Page"
  Backbone = require "backbone"
  require "epoxy"
  SwipeGalleryComponent = require "SwipeGalleryComponent"

  SampleCollection = Backbone.Collection.extend
    model: Backbone.Epoxy.Model

  SwipeItem = require "view/list/SwipeItem/SwipeItem"

  SwipePage = _Page.extend
    template: "#SwipePage"
    className: "swipe_page"

    ui:
      addLoop: "[data-js='add-loop']"
      addSimple: "[data-js='add-simple']"

    events:
      "click @ui.addLoop": "onClickLoop"
      "click @ui.addSimple": "onClickSimple"

    regions:
      LoopGallery:
        el: "[data-view-loop]"
        view: SwipeGalleryComponent.extend
        # Указываем, каким item-ом мы будем отрисовывать элемент галереи
          itemView: SwipeItem

      SimpleGallery:
        el: "[data-view-simple]"
        view: SwipeGalleryComponent.extend
          itemView: SwipeItem
        scope: -> {collection: @sampleCollection}

    scope: ->
      @sampleCollection = new SampleCollection
      @sampleCollection.add @_sampleData()

    initialize: ->
      @r.LoopGallery.setOptions {loop: true, elementsOnSide: 4, positionActive: 'center'}
      @r.LoopGallery.collection.reset @_sampleData()

    _sampleData: ->
      {num: i} for i in [1..10]

    onClickLoop: ->
      @__numberLoop ?= 11
      @r.LoopGallery.collection.add {num: @__numberLoop}
      @__numberLoop++

    onClickSimple: ->
      @__numberSimple ?= 11
      @r.SimpleGallery.collection.add {num: @__numberSimple}
      @__numberSimple++

