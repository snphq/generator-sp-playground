define (require, exports, module)->
  _Page = require "../_Page"
  ScrollPage = _Page.extend
    template: "#ScrollPage"
    className: "scroll_page"
