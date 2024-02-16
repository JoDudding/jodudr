#' @title Call and open the quarto html template
#' @param report_name short name for your report
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

    usethis::use_template(
      "quarto-html.qmd",
      save_as = here::here(folder, file_name),
      data = list(
        report_date = report_date,
        report_name = report_name
      ),
      package = "jodudr", ..., open = open)

    # copy over scss, png and _quarto.yml if not already there

    if(! file.exists(here::here("resources", "jo.scss"))) {
      usethis::use_template(
        "jo.scss",
        save_as = here::here("resources", "jo.scss")
      )
    }


    if(! file.exists(here::here("resources", "jodudr.png"))) {
      usethis::use_template(
        "jodudr.png",
        save_as = here::here("resources", "jodudr.pngs")
      )
    }


    if(! file.exists(here::here("resources", "jodudr-plain.png"))) {
      usethis::use_template(
        "jodudr-plain.png",
        save_as = here::here("resources", "jodudr-plain.png")
      )
    }


    if(! file.exists(here::here("_quarto.yml"))) {
      usethis::use_template(
        "_quarto.yml",
        save_as = here::here("_quarto.yml")
      )
    }

    if(! file.exists(here::here("scripts", "_setup.r"))) {
      usethis::use_template(
        "_setup.r",
        save_as = here::here("scripts", "_setup.r")
      )
    }

  }
