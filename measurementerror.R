library(ggplot2)
library(dplyr)

# Generate random data from a normal distribution
set.seed(42)
x <- seq(-3, 3, length=100)
y <- dnorm(x)
se <- .175-y*.4
df <- data.frame(x,y)

# Plot the normal distribution using ggplot2
p <- ggplot(df, aes(x = x, y = y))
p <- p + geom_line(color = "#336666", size = 2) 
p <- p + geom_line(aes(x=x,y=se), color = "#C0392B", size = 2) 
p <- p + geom_segment(aes(x = -3, xend = 3, y = .1, yend = .1), size = 2, color = '#30394F')
# p <- p + labs(title = "Normal Distribution Plot",
#                 x = "Value",
#                 y = "frequency")
p <- p + theme_void()
p


ggsave(p,
       filename = "measurementerror.png",
       device = png, 
       height = 2,
       width = 3,
       units = "in",
       type = "cairo", 
       dpi = 150)
