# New-Year-Resolutions-analysis

**R Code for analysis**

**Install and load necessary packages**
install.packages("ggplot2")
library(ggplot2)
library(dplyr)
**Define the data**
labels <- c('Career', 'Education/Training', 'Family/Friends/Relationships', 'Finance',
            'Health & Fitness', 'Humor', 'Personal Growth', 'Philanthropic',
            'Recreation & Leisure', 'Time Management/Organization', 'user_gender')
sizes <- c(123, 87, 327, 167, 825, 887, 1678, 83, 461, 85, 123)
explode <- c(0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0, 0)

**Create a data frame**
data <- data.frame(labels, sizes, explode)

**Set a color palette**
colors <- rainbow(length(labels))
**Create a pie chart with values outside**
pie_chart <- ggplot(data, aes(x = "", y = sizes, fill = labels)) +
  geom_bar(stat = "identity", width = 1, color = "white", position = position_fill(vjust = 0.5)) +
  coord_polar("y") +
  theme_void() +
  theme(legend.position="bottom") +
  scale_fill_manual(values = colors)

**Display the pie chart with values outside**
print(pie_chart)
![image](https://github.com/tav97/New-Year-Resolutions-analysis/assets/151886105/ee5264f3-bbc7-4fdd-b59c-708a16b0c052)
