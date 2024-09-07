#' Set a Alexandria Ocasio Cortez inspired look to a ggplot2 plot
#' @export
theme_aoc <- \(){  
  if(!requireNamespace("showtext")) {
    stop("{showtext} package is requried.")
  }
  sysfonts::font_add_google("Nunito", "nunito")
  ggplot2::theme_minimal(base_family = "nunito") +
    ggplot2::theme(
      legend.position = "none",
      axis.text = ggplot2::element_text(color = "grey20"),
      axis.title = ggplot2::element_text(color = "grey20"),
      axis.line = ggplot2::element_line(color = "grey20"),
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major.x = ggplot2::element_blank(),
      panel.grid.major.y = ggplot2::element_line(color = "grey60", linetype = "dashed"),
      plot.title = ggplot2::element_text(face = "bold", hjust = 0.5)
    )
}

#' Set a Alexandria Ocasio Cortez inspired look to a ggplot2 labels
#' @param title that it will be transformed uppercase
#' @param ... additional parameters to the labs function
#' @export
labs_aoc <- function(title, ...) {
    ggplot2::labs(
      title = toupper(title),
      ...
    )
}

#' Set a Alexandria Ocasio Cortez inspired look to a ggplot2 color scales
#' @rdname scale_color_aoc
#' @export
scale_color_aoc <- \() {
  ggplot2::scale_color_manual(values = c("darkgreen", "green"))
}

#' A labeller function to supply to facet_grid() or facet_wrap() for the argument labeller.
#' @param ... optional parameters to the labeller function
#' @export
labeller_aoc <- function(...) {
  ggplot2::labeller(.default = toupper, ...)
}

#' @rdname scale_color_aoc
#' @export
scale_colour_aoc <- scale_color_aoc

