
#' Internal helper function for package development
#' @examples
#' if (FALSE) {
#'   devtools::load_all(); rebuild_package_and_check()
#' }
#' 
#' @noRd
rebuild_package_and_check <- function() {
  previous_version <- "0.0.0.9000"
  usethis::use_description(list(
      "Title" = "Alexandria Ocasio-Cortez inspired ggplots",
      "Description" = "The ggaoc package provides a theme, palette, and other useful functions to customise ggplots and give them a Alexandria Ocasio-Cortez inspired look.",
      "Version" = previous_version,
      "Authors@R" = c(
        utils::person(
          "Jordi", "Rosell",
          email = "jroselln@gmail.com",
          role = c("aut", "cre"),
          comment = c(ORCID = "0000-0002-4349-1458")
        ),
        utils::person(
          "Frankie T.", "Hull",
          email = "frankiethull@gmail.com",
          role = c("aut")
        )
      ),
      Language =  "en"
  ))
  #usethis::use_git()
  usethis::use_package("R", type = "Depends", min_version = "4.4")
  usethis::use_mit_license()
  #usethis::use_proprietary_license("The ducks in a row S.L.")
  write(
      "URL: https://github.com/jrosell/ggaoc",
      here::here("DESCRIPTION"),
      append = TRUE
  )
  suggests_packages <- c(   
      "testthat",
      "gapminder",
      "devtools",
      "here",
      "pkgdown",
      "purrr",
      "usethis"
  )
  suggests_packages |> purrr::walk(
      \(x){usethis::use_package(x, type = "Suggests"); x}
  )
  imports_packages <- c(
      "ggplot2",
      "showtext"
  )
  imports_packages |> purrr::walk(
      \(x){usethis::use_package(x, type = "Imports"); x}
  )
  devtools::load_all()  
  devtools::check(document = FALSE)
  devtools::document()
  pkgdown::build_site(preview = FALSE)
  utils::browseURL(here::here("docs", "index.html"), browser = "firefox")
  # usethis::use_version(which = "dev", push = FALSE)
}
