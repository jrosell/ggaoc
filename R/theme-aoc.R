#' Set a Alexandria Ocasio Cortez inspired look to a ggplot2 plot
#' @export
theme_aoc <- \(){  
  if(!requireNamespace("showtext")) {
    stop("{showtext] package is requried.")
  }
  library(showtext)
  font_add_google("Nunito", "nunito")
  font_families()
  ggplot2::theme_minimal(base_family = "nunito") +
    ggplot2::theme(
      legend.position = "none",
      axis.text = element_text(color = "grey20"),
      axis.title = element_text(color = "grey20"),
      axis.line = element_line(color = "grey20"),
      panel.grid.minor = element_blank(),
      panel.grid.major.x = element_blank(),
      panel.grid.major.y = element_line(color = "grey60", linetype = "dashed"),
      plot.title = element_text(face = "bold", hjust = 0.5)
    )
}

#' Set a Alexandria Ocasio Cortez inspired look to a ggplot2 labels
#' @param title that it will be transformed uppercase
#' @param ... additional parameters to the labs function
#' @export
labs_aoc <- function(title, ...) {
    labs(
      title = toupper(title),
      ...
    )
}

#' Set a Alexandria Ocasio Cortez inspired look to a ggplot2 color scales
#' @rdname scale_color_aoc
#' @export
scale_color_aoc <- \() {
  scale_color_manual(values = c("darkgreen", "green"))
}

#' A labeller function to supply to facet_grid() or facet_wrap() for the argument labeller.
#' @param ... optional parameters to the labeller function
#' @export
labeller_aoc <- function(...) {
  labeller(.default = toupper, ...)
}

#' @rdname scale_color_aoc
#' @export
scale_colour_aoc <- scale_color_aoc