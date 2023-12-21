# Unveiling New Year Resolutions Trends Through Data Analytics

# Technologies Used
R, R studio
# Approach for analysis
Exploring the Tweet Categories:
1) To start, I visualized the popularity of different New Year resolution categories using a pie chart. 
2) Analyzing the gender distribution of tweets revealed that out of the 4723 tweets, 2367 tweets were posted by females, and 2356 tweets were posted by males.
3) I delved into retweet trends across different categories. Finance, Family/Friends/Relationships, and Personal Growth emerged as the categories with the highest number of retweets.
4) I explored tweet distribution across regions. The bar chart provides a glimpse into the number of tweets originating from different regions. 

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

**Here I analysed the popularity region wise**

library(ggplot2)
library(RColorBrewer)
Map tweet_region to the x-axis in aes(),Used geom_bar() function to create bars, Color based on tweet_region grouped values and then set the viridis palette
Added a title with ggtitle anchored in the middle

ggplot(New_years_resolutions, aes(x=tweet_region)) +
  geom_bar(aes(fill=tweet_region), color="black") + 
  scale_fill_brewer(palette = "viridis") +
  ggtitle("Number of tweets by different region") +
  theme(plot.title = element_text(hjust = 0.5))
![image](https://github.com/tav97/New-Year-Resolutions-analysis/assets/151886105/6de7e51f-2925-428d-938e-c3ce2d55adaf)


