library(ggplot2)
library(tidyverse)

results <- tibble(
  name = c("Tomas", "Barbara", "Fuso", "Skeptic", "TJ Kirk"),
  economic = c(-4.5, -8.63, 1.25, -0.60, -6.3),
  social = c(-4.92, -7.33, -7.79, -3.20, -6.9)
)

thm <- theme_bw() +
  theme(
    panel.background = element_rect(fill = NA),
    panel.grid.major = element_line(colour = "grey50"),
    panel.grid.minor = element_line(colour = "grey50"),
    panel.ontop = TRUE,
    aspect.ratio = 1,
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    legend.text = element_blank()
  )
theme_set(thm)

getPlot <- function() {
  plt0_base <- ggplot(results, aes(x = economic, y = social))
  
  plt1_scales <- plt0_base +
    scale_y_continuous(breaks = seq(-10, 10, 2), expand = c(0, 0)) +
    scale_x_continuous(breaks = seq(-10, 10, 2), expand = c(0, 0))
  
  plt2_annotations <- plt1_scales +
    annotate("rect", xmin = -10, xmax =  0, ymin = -10, ymax =  0, fill = "#9ceb9a") +
    annotate("rect", xmin =   0, xmax = 10, ymin = -10, ymax =  0, fill = "#bf9ce8") +
    annotate("rect", xmin = -10, xmax =  0, ymin =   0, ymax = 10, fill = "#fd7678") +
    annotate("rect", xmin =   0, xmax = 10, ymin =   0, ymax = 10, fill = "#48acfc") +
    annotate("text", x = 0, y = 9.5, label = "authoritarian", fontface = "bold",size = 7, color = "black") +
    annotate("text", x = 0, y = -9.5, label = "libertarian", fontface = "bold", size = 7, color = "black") +
    annotate("text", x = -9.3, y = 0.5, label = "left", fontface = "bold", size = 7, color = "black") +
    annotate("text", x = 9, y = 0.5, label = "right", fontface = "bold", size = 7, color = "black")
  
  plt3_interceptss <- plt2_annotations +
    geom_vline(xintercept = 0, size = 2) +
    geom_hline(yintercept = 0, size = 2)
  
  plt4_scatter <- plt3_interceptss + 
    geom_point(size = 3) +
    geom_text(aes(label = name), hjust = 0, nudge_x = 0.1, size = 5,
      check_overlap = TRUE, colour = "#708090", fontface = "bold")

  plt4_scatter
}