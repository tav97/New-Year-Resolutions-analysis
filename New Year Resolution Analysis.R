# Install and load necessary packages
install.packages("ggplot2")
library(ggplot2)
library(dplyr)

# Define the data
labels <- c('Career', 'Education/Training', 'Family/Friends/Relationships', 'Finance',
            'Health & Fitness', 'Humor', 'Personal Growth', 'Philanthropic',
            'Recreation & Leisure', 'Time Management/Organization', 'user_gender')
sizes <- c(123, 87, 327, 167, 825, 887, 1678, 83, 461, 85, 123)
explode <- c(0, 0, 0, 0, 0, 0, 0.1, 0, 0, 0, 0)

# Create a data frame
data <- data.frame(labels, sizes, explode)

# Set a color palette
colors <- rainbow(length(labels))

# Create a pie chart with values
pie_chart <- ggplot(data, aes(x = "", y = sizes, fill = labels)) +
  geom_bar(stat = "identity", width = 1, color = "white", position = position_fill(vjust = 0.5)) +
  coord_polar("y") +
  theme_void() +
  theme(legend.position="bottom") +
  scale_fill_manual(values = colors)

# Display the pie chart with values outside
print(pie_chart)

# Add a user_gender column (assuming it's a character column)
data$user_gender <- c("Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female", "Male")

# Convert 'user_gender' to a factor with numeric levels
data$user_gender <- factor(data$user_gender, levels = c("Male", "Female"), labels = c(1, 2))

# Display the counts
gender_counts <- table(data$user_gender)
print(gender_counts)

# Create vector of categories, Collapse into regex string with str_c() and collapse, Use str_detect() to check for matches,Filter the rows with filter()

library(stringr)

categories <- c("Career", "Education/Training", "Family/Friends/Relationships", "Finance",  
                "Health & Fitness", "Humor", "Personal Growth", "Philanthropic",
                "Recreation & Leisure", "Time Management/Organization")

category_regex <- str_c(categories, collapse = "|") 

category_gender <- tweetcategory_gender %>% 
  filter(str_detect(tweet_category, category_regex))

library(dplyr)
library(ggplot2)

# Summarize retweet count by category
newyear_summary <- New_years_resolutions %>% 
  group_by(tweet_category) %>%
  summarize(retweets = sum(retweet_count))

# Plot 
ggplot(newyear_summary, aes(x=retweets, y=tweet_category)) + 
  geom_col(fill="maroon") +
  labs(x="Sum of Retweets", 
       y="Categories",
       title="Sum of Retweets By Categories")



# Confirm retweet_count column exists
glimpse(New_years_resolutions) 

# Check if any NA values
sum(is.na(New_years_resolutions$retweet_count))

# Alternative aggregation 
newyear_summary <- New_years_resolutions %>%
  group_by(tweet_category) %>%
  summarize(retweets = mean(retweet_count, na.rm = TRUE))

# Check if values look reasonable
head(newyear_summary)

library(ggplot2)
library(RColorBrewer)

ggplot(New_years_resolutions, aes(x=tweet_region)) +
  geom_bar(aes(fill=tweet_region), color="black") + 
  scale_fill_brewer(palette = "viridis") +
  ggtitle("Number of tweets by different region") +
  theme(plot.title = element_text(hjust = 0.5))

