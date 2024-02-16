#' @title Call and open the quarto html template
#' @param report_name short name for your report
#' @param folder folder to save the report to - defaults to notebooks
#' @param open should the file be opened after being created
#' @param ... arguments to be passed to \link[usethis]{use_template}
#' @importFrom usethis use_template
#' @examples
#' \donttest{
#' if(interactive()){
#'   use_quarto_html(name = "Very important report")
#' }
#' }
#'
#' @export
use_quarto_html <- function(
    report_name = NULL,
    folder = "notebooks",
    open = interactive(),
    ...
) {

    report_date <- format(lubridate::today(),"%Y-%m-%d")

    if(is.null(report_name)){ report_name <- paste("project", report_date) }

    file_name <- paste0(
      stringr::str_replace_all(stringr::str_to_lower(report_name), " ", "-"),
      ".qmd"
    )

    if( ! fs::dir_exists(folder)) {fs::dir_create(folder)}

    usethis::use_template(
      "quarto-html.qmd",
      save_as = glue::glue("{folder}/{file_name}"),
      data = list(
        report_date = report_date,
        report_name = report_name
      ),
      package = "jodudr", ..., open = open)

    # copy over scss, png and _quarto.yml if not already there

    if( ! fs::dir_exists("resources")) {fs::dir_create("resources")}

    if(! file.exists("resources/jo.scss")) {
      usethis::use_template(
        "jo.scss",
        save_as = "resources/jo.scss",
        package = "jodudr"
      )
    }

    # this method does not work for png - find another way

    #if(! file.exists("resources/jodudr.png")) {
    #  usethis::use_template(
    #    "jodudr.png",
    #    save_as = "resources/jodudr.png",
    #    package = "jodudr"
    #  )
    #}


    #if(! file.exists("resources/jodudr-plain.png")) {
    #  usethis::use_template(
    #    "jodudr-plain.png",
    #    save_as = "resources/jodudr-plain.png",
    #    package = "jodudr"
    #  )
    #}

    if(! file.exists("_quarto.yml")) {
      usethis::use_template(
        "_quarto.yml",
        save_as = "_quarto.yml",
        package = "jodudr"
      )
    }

    if( ! fs::dir_exists("scripts")) {fs::dir_create("scripts")}

    if(! file.exists("scripts/_setup.r")) {
      usethis::use_template(
        "_setup.r",
        save_as = "scripts/_setup.r",
        package = "jodudr"
      )
    }

  }
