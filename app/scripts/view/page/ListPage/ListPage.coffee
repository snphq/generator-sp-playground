define (require, exports, module)->
  _Page = require "../_Page"
  Backbone = require "backbone"
  ListComponent = require "ListComponent"


  SampleModel = Backbone.Model.extend
    defaults:
      title: ''
      active: false


  SampleCollection = Backbone.Collection.extend
    model: SampleModel


  ItemView = _Page.extend
    events:
      "click": "onClick"

    onClick: ->
      active = not @model.get 'active'
      @model.set {active}


  ListPage = _Page.extend
    template: "#ListPage"
    className: "list_page"

    regions:
      list1:
        el: '[data-view-list-1]'
        view: ListComponent
        scope: ->
          {collection: @sampleCollection}
      list2:
        el: '[data-view-list-2]'
        view: ListComponent.extend
          itemView: ItemView
        scope: ->
          {collection: @sampleCollection}

    scope: ->
      @sampleCollection = new SampleCollection
      sampleData = ({title: "Sample #{i}"} for i in [1..5])
      @sampleCollection.add sampleData
