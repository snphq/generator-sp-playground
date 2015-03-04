define (require, exports, module)->
  _Page = require "../_Page"
  SwipePage = _Page.extend
    template: "#SwipePage"
    className: "swipe_page"
