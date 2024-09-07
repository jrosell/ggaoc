test_that("theme_aoc works", {  
  library(ggplot2)
  library(gapminder)
  theme_set(theme_aoc())
  americas <- gapminder[gapminder$continent == "Americas",]
  americas |> 
    ggplot() +
    geom_jitter(aes(year, lifeExp, colour = "Points")) +
    geom_smooth(aes(year, lifeExp, colour = "Trend")) +
    scale_color_aoc() + 
    labs_aoc(
      title = "Americas | Life Expectation by Year",
      x = "Year",
      y = "Age by Country"
    )
})

