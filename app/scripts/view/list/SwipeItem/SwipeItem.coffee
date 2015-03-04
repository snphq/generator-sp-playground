define (require, exports, module)->
  _Item = require "../_Item"
  SwipeItem = _Item.extend
    template: "#SwipeItem"
    className: "swipe_item"
    tagName: "li"

    ui:
      name: "h1"

    bindings:
      "@ui.name": "text: num"
