#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path("www",app_sys("app/www"))
  add_resource_path( 'img', app_sys('app/img'))
  add_resource_path( 'js', app_sys('app/www/js'))
  tagList(
    tags$head(
      favicon(),
      bundle_resources(
        path = app_sys("app/www"),
        app_title = "starbase"
      ),
      # Add here other external resources
      # for example, you can add shinyalert::useShinyalert()
      tags$link(rel="stylesheet", type="text/css",href="www/custom.css")
    )
  )
}