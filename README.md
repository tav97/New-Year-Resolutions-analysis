# New-Year-Resolutions-analysis

# R Code for analysis

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

**examine the popularity of categories according to gender**
New_years_resolutions %>% 
  count(user_gender)
![image](https://github.com/tav97/New-Year-Resolutions-analysis/assets/151886105/d20d883f-fa3a-4dd5-a0f9-550ab61176ea)

To analyze the popularity of tweet categories based on retweets, 
I utilized the matplotlib library to create a straightforward bar chart. The code and resulting output are as follows:

**Summarize retweet count by category**
newyear_summary <- New_years_resolutions %>% 
  group_by(tweet_category) %>%
  summarize(retweets = sum(retweet_count))

**Check if any NA values**
sum(is.na(New_years_resolutions$retweet_count))
**Alternative aggregation**
newyear_summary <- New_years_resolutions %>%
  group_by(tweet_category) %>%
  summarize(retweets = mean(retweet_count, na.rm = TRUE))

**Plot** 
ggplot(newyear_summary, aes(x=retweets, y=tweet_category)) + 
  geom_col(fill="maroon") +
  labs(x="Sum of Retweets", 
       y="Categories",
       title="Sum of Retweets By Categories")

![image](https://github.com/tav97/New-Year-Resolutions-analysis/assets/151886105/bafc509c-5ea0-4958-bab9-4d921344918e)


