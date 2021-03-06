import ../src/starlight except loginPage
import utils


var app = newApp(newSettings())

proc hello*(ctx: Context) {.async,
  get(app, "/"),
  post(app, "/"),
  get(app, "/hello")
  .} =
  resp "<h1>Hello, Prologue!</h1>"

proc home*(ctx: Context) {.async, route(app, "/home", HttpGet).} =
  resp "<h1>Home</h1>"

proc helloName*(ctx: Context) {.async, get(app, "/hello/{name}").} =
  resp "<h1>Hello, " & ctx.getPathParams("name", "Prologue!") & "</h1>"

proc redirectHome*(ctx: Context) {.async, route(app, "/redirect").} =
  resp redirect("/home")

proc loginGet*(ctx: Context) {.async, route(app, "/loginget").} =
  resp loginGetPage()

proc doLoginGet*(ctx: Context) {.async, route(app, "/loginpage", [HttpGet, HttpPost]).} =
  resp redirect("/hello/Nim")

proc login*(ctx: Context) {.async, get(app, "/login").} =
  resp loginPage()

proc doLogin*(ctx: Context) {.async, post(app, "/login").} =
  resp redirect("/hello/Nim")


app.run()
