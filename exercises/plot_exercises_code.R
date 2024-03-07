# plot 1 ------------------------------------------------------------------

pal_bg <- c("brown", "darkslategrey", "lemonchiffon")
par(family = "serif",
    bg = "floralwhite",
    tck = -.05)

pairs(iris[1:4], 
      lower.panel = NULL, 
      bg = pal_bg[iris$Species], 
      pch = 21,
      labels = gsub("\\.", " ", names(iris[1:4])),
      main = "The infamous Iris dataset"
)

dev.off() # to reset par() to its def state

# plot 2 ------------------------------------------------------------------

means <- tapply(PlantGrowth$weight, PlantGrowth$group, mean)

par(family = "sans",
    tck = NA,
    mar = c(4, 8, 4, 4),
    family = "mono",
    las = 1,
    lwd = 2,
    col.main = "darkblue",
    col.axis = "darkblue",
    fg = "darkblue")

barplot(means,
        horiz = TRUE,
        col = "#dff9fb",
        border = "#22a6b3",
        names = c("Control", "Treatment 1", "Treatment 2"),
        density = 25,
        angle = 45, 
        main = paste("Plants mean weight by treatment,\n from dataset PlantGrowth"),
        asp = 1)

dev.off()

# plot 3 ------------------------------------------------------------------
library(palmerpenguins)

penguins$species <- reorder(penguins$species, 
                            penguins$bill_length_mm,
                            FUN = \(x) mean(x, na.rm = TRUE))

n_penguins <- table(penguins[!is.na(penguins$bill_depth_mm), "species"])
name_penguins <- levels(penguins$species)

par(family = "serif")
boxplot(bill_length_mm ~ species, data = penguins,
        ylab = "",
        xlab = "",
        axes = FALSE,
        varwidth = TRUE,
        col = "#dfe4ea",
        border = "#2d3436",
        boxcol = "transparent",
        lty = "solid",
        staplelty = "blank",
        main = "Palmer penguins bill length, in mm")
axis(1, at = 1:3, 
     labels =  paste0(name_penguins, "\n(n = ", n_penguins, ")"), 
     tick = FALSE)
axis(2, las = 1, tick = FALSE)
