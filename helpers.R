library(ggplot2)
library(tidyverse)
library(extrafont)
library("ggrepel")

# loadfonts()

results <- tibble(
  name = c("Tomas", "Barbara", "Fuso", "Skeptic", "TJ Kirk", "Franjas", "Esteban", "Vishious", "Troglo!?", "Sora", "Tita", "Tone", "Sofia"),
  color = c("pc", "pc", "pc", "npc", "npc", "pc", "pc", "pc", "npc", "pc", "pc", "pc", "pc"),
  economic = c(-4.50, -8.63,  1.25, -0.60, -6.30, -3.25, -4.00, -4.25, 7.25, -6.13, -5.38, -4.88, -4.00),
  social   = c(-4.92, -7.33, -7.79, -3.20, -6.90, -4.62, -5.38, -5.33, 7.44, -4.67, -5.64, -3.33, -4.05)
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
    annotate("text", x = 0, y = 9.5, label = "authoritarian", fontface = "bold",size = 6, color = "#35333d", family = "Andale Mono") +
    annotate("text", x = 0, y = -9.5, label = "libertarian", fontface = "bold", size = 6, color = "#35333d", family = "Andale Mono") +
    annotate("text", x = -9, y = 0.5, label = "left", fontface = "bold", size = 6, color = "#35333d", family = "Andale Mono") +
    annotate("text", x = 9, y = 0.5, label = "right", fontface = "bold", size = 6, color = "#35333d", family = "Andale Mono")
  
  plt3_interceptss <- plt2_annotations +
    geom_vline(xintercept = 0, size = 2) +
    geom_hline(yintercept = 0, size = 2)
  
  plt4_scatter <- plt3_interceptss + 
    geom_point(size = 2) +
    geom_text_repel(aes(label = name, colour = color),
      family = "Trebuchet MS", size = 4, fontface = "bold", show.legend = FALSE) +
      scale_colour_manual(values = c("pc" = "#615c6f", "npc" = "#a6a1b2"))
  plt4_scatter
}