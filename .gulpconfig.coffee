module.exports =
  app: "app"
  extras:[]
  scripts:[]

  server:
    port: 9000

  cdn:
    host: ""

  # Use spritesmith options to configure for each sprite   https://github.com/twolfson/gulp.spritesmith#documentation
  sprites: {
    # icons:
    #   cssFormat: 'css'
  }

  proxy:
    port: 9001
    remotes:
      dist:
        active: true
        host: "project.t.snpdev.ru"
        port: 80
        https: false
      prod:
        active: true
        host: "google.ru"
        port: 80
        https: false

    routers:
      dist:
        "wiki/Main_Page$":
          host:"en.wikipedia.org"
          port:80
          https:false
      prod:
        "wiki/Main_Page$":
          host:"en.wikipedia.org"
          port:80
          https:false
