define (require, exports, module)->
  _Page = require "../_Page"
  EmbededVideoComponent = require "EmbededVideoComponent"
  ListComponent = require "ListComponent"
  Backbone = require "backbone"
  require "epoxy"

  VideoModel = Backbone.Epoxy.Model.extend
    defaults:
      code: "qcljlDHSKO0"
    computeds:
      video: ->
        "https://www.youtube.com/embed/#{@get 'code'}"
      image: ->
        "http://img.youtube.com/vi/#{@get 'code'}/hqdefault.jpg"


  playlistData = [
    code: '7d_jQycdQGo'
    title: 'Whiplash TRAILER 1 (2014) - J.K. Simmons, Miles Teller Movie HD'
  ,
    code: 'kl8F-8tR8to'
    title: 'Kingsman: The Secret Service | Official Trailer 2 [HD] | 20th Century FOX'
  ,
    code: 'uJfLoE6hanc'
    title: 'BIRDMAN - Official International Trailer'
  ,
    code: '7bZFr2IA0Bo'
    title: 'Paddington – Official International Trailer'
  ]

  VideoCollection = Backbone.Collection.extend
    model: VideoModel

  PlayListItemView = _Page.extend
    events:
      "click": "onClick"

    onClick: ->
      @model.collection.trigger 'select', @model

  EmbededVideoPage = _Page.extend
    template: "#EmbededVideoPage"
    className: "embededvideo_page"

    ui:
      'videoCode': '[data-js-code]'

    bindings:
      '@ui.videoCode': 'value: code'

    regions:
      video1:
        el: "[data-view-video-1]"
        view: EmbededVideoComponent
        scope: ->
          data:
            video: "https://www.youtube.com/embed/UBS4Gi1y_nc"
            image: "http://img.youtube.com/vi/UBS4Gi1y_nc/maxresdefault.jpg"

      video2:
        el: "[data-view-video-2]"
        view: EmbededVideoComponent
        scope: -> {model:@model}

      video3:
        el: "[data-view-video-3]"
        view: EmbededVideoComponent

      playlist:
        el: "[data-view-playlist]"
        view: ListComponent.extend
          itemView: PlayListItemView
        scope: -> {collection: @playlistCollection}

    scope: ->
      @playlistCollection = new VideoCollection
      @playlistCollection.set playlistData
      @model = new VideoModel

    initialize: ->
      @r.video3.setModel @playlistCollection.at(0)
      @listenTo @playlistCollection, 'select', @onPlaylistSelect

    onPlaylistSelect: (model)->
      @r.video3.stop()
      @r.video3.setModel model




