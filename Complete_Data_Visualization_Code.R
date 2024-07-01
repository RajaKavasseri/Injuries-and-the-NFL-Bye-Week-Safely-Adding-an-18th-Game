library(ggplot2)

#reading the data frame from each unique year. This is the original data I started with. 
injuries_2023 <- read.csv("C:/Users/rajak/OneDrive/UCLA/BSA/Data_Journalism_S24/Original_Injury_Data/injuries_2023.csv")
injuries_2022 <- read.csv("C:/Users/rajak/OneDrive/UCLA/BSA/Data_Journalism_S24/Original_Injury_Data/injuries_2022.csv")
injuries_2021 <- read.csv("C:/Users/rajak/OneDrive/UCLA/BSA/Data_Journalism_S24/Original_Injury_Data/injuries_2021.csv")
injuries_2020 <- read.csv("C:/Users/rajak/OneDrive/UCLA/BSA/Data_Journalism_S24/Original_Injury_Data/injuries_2020.csv")
injuries_2019 <- read.csv("C:/Users/rajak/OneDrive/UCLA/BSA/Data_Journalism_S24/Original_Injury_Data/injuries_2019.csv")
injuries_2018 <- read.csv("C:/Users/rajak/OneDrive/UCLA/BSA/Data_Journalism_S24/Original_Injury_Data/injuries_2018.csv")
injuries_2017 <- read.csv("C:/Users/rajak/OneDrive/UCLA/BSA/Data_Journalism_S24/Original_Injury_Data/injuries_2017.csv")
injuries_2016 <- read.csv("C:/Users/rajak/OneDrive/UCLA/BSA/Data_Journalism_S24/Original_Injury_Data/injuries_2016.csv")

#creating bye weeks corresponding to each team for each year
bye_weeks_2023 <- data.frame(
  team = c("CLE", "LAC", "SEA", "TB", "GB", "PIT", "CAR", "CIN", "DAL", "HOU", "NYJ", "TEN", "DEN", "DET", "JAX", "SF", "KC", "LA", "MIA", "PHI", "ATL", "IND", "NE", "NO", "BAL", "BUF", "CHI", "LV", "MIN", "NYG", "ARI", "WAS"),
  bye = c(rep(5,4), rep(6, 2), rep(7, 6), rep(9, 4), rep(10, 4), rep(11, 4), rep(13, 6), rep(14, 2))
)
bye_weeks_2022 <- data.frame(
  team = c("CLE", "LAC", "SEA", "TB", "GB", "PIT", "CAR", "CIN", "DAL", "HOU", "NYJ", "TEN", "DEN", "DET", "JAX", "SF", "KC", "LA", "MIA", "PHI", "ATL", "IND", "NE", "NO", "BAL", "BUF", "CHI", "LV", "MIN", "NYG", "ARI", "WAS"),
  bye = c(9, 8, 11, 11, 14, 9, 13, 10, 9, 6, 10, 6, 9, 6, 11, 9, 8, 7, 11, 7, 14, 14, 10, 14, 10, 7, 14, 6, 7, 9, 13, 14)
)
bye_weeks_2021 <- data.frame(
  team = c("CLE", "LAC", "SEA", "TB", "GB", "PIT", "CAR", "CIN", "DAL", "HOU", "NYJ", "TEN", "DEN", "DET", "JAX", "SF", "KC", "LA", "MIA", "PHI", "ATL", "IND", "NE", "NO", "BAL", "BUF", "CHI", "LV", "MIN", "NYG", "ARI", "WAS"),
  bye = c(13, 7, 9, 9, 13, 7, 13, 10, 7, 10, 6, 13, 11, 9, 7, 6, 12, 11, 14, 14, 6, 14, 14, 6, 8, 7, 10, 8, 7, 10, 12, 9)
)
bye_weeks_2020 <- data.frame(
  team = c("PIT", "TEN", "DET", "DEN", "GB", "NE", "SEA", "LAC", "NO", "LV", "BAL", "MIN", "IND", "MIA", "ARI", "HOU", "JAX", "WAS", "CIN", "LA", "CLE", "PHI", "NYJ", "DAL", "ATL", "KC", "SF", "BUF", "CHI", "NYG", "TB", "CAR"),
  bye = c(4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 11, 11, 11, 11, 13, 13)
)
bye_weeks_2019 <- data.frame(
  team = c("PIT", "TEN", "DET", "DEN", "GB", "NE", "SEA", "LAC", "NO", "OAK", "BAL", "MIN", "IND", "MIA", "ARI", "HOU", "JAX", "WAS", "CIN", "LA", "CLE", "PHI", "NYJ", "DAL", "ATL", "KC", "SF", "BUF", "CHI", "NYG", "TB", "CAR"),
  bye = c(7, 11, 5, 10, 11, 10, 11, 12, 9, 6, 8, 12, 6, 5, 12, 10, 10, 10, 9, 9, 7, 10, 4, 8, 9, 12, 4, 6, 6, 11, 7, 7)
)
bye_weeks_2018 <- data.frame(
  team = c("PIT", "TEN", "DET", "DEN", "GB", "NE", "SEA", "LAC", "NO", "OAK", "BAL", "MIN", "IND", "MIA", "ARI", "HOU", "JAX", "WAS", "CIN", "LA", "CLE", "PHI", "NYJ", "DAL", "ATL", "KC", "SF", "BUF", "CHI", "NYG", "TB", "CAR"),
  bye = c(7, 8, 6, 10, 7, 11, 7, 8, 6, 7, 10, 10, 9, 11, 9, 10, 9, 4, 9, 12, 11, 9, 11, 8, 8, 12, 11, 11, 5, 9, 5, 4)
)
bye_weeks_2017 <- data.frame(
  team = c("PIT", "TEN", "DET", "DEN", "GB", "NE", "SEA", "LAC", "NO", "OAK", "BAL", "MIN", "IND", "MIA", "ARI", "HOU", "JAX", "WAS", "CIN", "LA", "CLE", "PHI", "NYJ", "DAL", "ATL", "KC", "SF", "BUF", "CHI", "NYG", "TB", "CAR"),
  bye = c(9, 8, 7, 5, 8, 9, 6, 9, 5, 10, 10, 9, 11, 11, 8, 7, 8, 5, 6, 8, 9, 10, 11, 6, 5, 10, 11, 6, 9, 8, 11, 11)
)
bye_weeks_2016 <- data.frame(
  team = c("PIT", "TEN", "DET", "DEN", "GB", "NE", "SEA", "SD", "NO", "OAK", "BAL", "MIN", "IND", "MIA", "ARI", "HOU", "JAX", "WAS", "CIN", "LA", "CLE", "PHI", "NYJ", "DAL", "ATL", "KC", "SF", "BUF", "CHI", "NYG", "TB", "CAR"),
  bye = c(8, 13, 10, 11, 4, 9, 5, 11, 5, 10, 8, 6, 10, 8, 9, 9, 5, 9, 9, 8, 13, 4, 11, 7, 11, 5, 8, 10, 9, 8, 6, 7)
)

#merge each year's data frame with the year's bye weeks dataframe
injuries_2023 <- merge(injuries_2023, bye_weeks_2023, by = "team")
injuries_2022 <- merge(injuries_2022, bye_weeks_2022, by = "team")
injuries_2021 <- merge(injuries_2021, bye_weeks_2021, by = "team")
injuries_2020 <- merge(injuries_2020, bye_weeks_2020, by = "team")
injuries_2019 <- merge(injuries_2019, bye_weeks_2019, by = "team")
injuries_2018 <- merge(injuries_2018, bye_weeks_2018, by = "team")
injuries_2017 <- merge(injuries_2017, bye_weeks_2017, by = "team")
injuries_2016 <- merge(injuries_2016, bye_weeks_2016, by = "team")

#combining each dataframe into one. Selecting only regular season games and only players with a specific injury designation.
injuries_past_2016 <- rbind(injuries_2023, injuries_2022, injuries_2021, injuries_2020, injuries_2019, injuries_2018, injuries_2017, injuries_2016)
injuries_past_2016 <- injuries_past_2016[injuries_past_2016$game_type == "REG",]
injuries_past_2016 <- injuries_past_2016[injuries_past_2016$report_primary_injury != "", ]

#creating a week_diff column for the number of weeks after the bye week an injury occurred in
injuries_past_2016$week_diff <- injuries_past_2016$week - injuries_past_2016$bye

#merging all the bye weeks
byes_past_16 <- rbind(bye_weeks_2016, bye_weeks_2017, bye_weeks_2018, bye_weeks_2019, bye_weeks_2020, bye_weeks_2021, bye_weeks_2022, bye_weeks_2023)

#counting how many teams had byes in each week. adding zeroes in for the first 3 weeks and the last 4 weeks, as no teams had byes in these weeks.
bye_counts_past_16 <- as.numeric(table(byes_past_16$bye))
bye_counts_past_16 <- c(0, 0, 0, bye_counts_past_16, 0, 0, 0, 0)

#creating vectors of how many teams had each bye week for before 2021 and from 2021 onwards. this is because there were 18 weeks starting in the 2021 season, but only 17 weeks beforehand.
byes_16_20 <-rbind(bye_weeks_2016, bye_weeks_2017, bye_weeks_2018, bye_weeks_2019, bye_weeks_2020)
byes_21 <- rbind(bye_weeks_2021, bye_weeks_2022, bye_weeks_2023)

byes_16_20 <- c(0, 0, 0, as.numeric(table(byes_16_20$bye)), 0, 0, 0, 0)
byes_21 <- c(0, 0, 0, 0, as.numeric(table(byes_21$bye)), 0, 0, 0, 0)

#writing a function to count how many teams played in each "week_diff". For example, counting how many teams played 10 weeks before their bye week
before_diff_counter <- function(x) {
  week_diff <- numeric(0)
  for(i in seq_along(x)) {
    count <- numeric(0)
    for(j in min(length(x), i + 1):length(x)) {
      count <- c(count, x[j])
    }
    week_diff <- c(week_diff, sum(count))
  }
  week_diff
}
#combining the week_diff counts for before and after 2021
before_21 <- before_diff_counter(byes_21)
before_16_20 <- c(before_diff_counter(byes_16_20), 0)
before_diff_16 <- before_21 + before_16_20

#same thing as before_diff, but now counting how many teams played x weeks AFTER their bye week. 
after_diff_counter <- function(x) {
  week_diff <- numeric(0)
  for(i in seq_along(x)) {
    count <- numeric(0)
    for(j in seq_len(length(x) - i)) {
      count <- c(count, x[j])
    }
    week_diff <- c(week_diff, sum(count))
  }
  week_diff
}
#combining before_diff and after_diff to correctly count how many teams played -13 weeks after their bye (13 weeks before) all the way to 13 weeks after their bye. 
#we need to know the number of teams so we can divide the total number of injuries by the number of teams actually playing. Less teams play 10 weeks after their bye than 1 week after, for example, as the season ends less than 10 weeks after a team's week 12 bye
after_diff_21 <- after_diff_counter(byes_21)
after_diff_16_20 <- c(after_diff_counter(byes_16_20), 0)
after_diff_16 <- after_diff_16_20 + after_diff_21
diff_16 <- c(rev(before_diff_16), after_diff_16)
diff_16 <- diff_16[diff_16 != 0]

diff_16_df <- data.frame("week_diff" = c(-13:-1, 1:13), "injury_count" = as.numeric(table(injuries_past_2016$week_diff))[-14] / diff_16)

#plotting the number of injuries for each week_diff
week_diff_16_plot <- ggplot(diff_16_df, aes(x = week_diff, y = injury_count)) +
  geom_line(color = "blue", linewidth = 1) +
  geom_point(color = "blue", size = 2.5) +
  scale_x_continuous(breaks = diff_16_df$week_diff) +
  labs(x = "Weeks After Bye", y = "Average Number of Injuries per Team", title = "Injuries vs. Weeks After Bye")

#counting how many injuries there were per year for each of 2016 to 2023
injuries_per_year_16 <- table(injuries_past_2016$season)

injuries_per_year_df_16 <- data.frame("Season" = names(injuries_per_year_16), "Injuries" = as.vector(injuries_per_year_16))

#graphing injuries per year on a line graph. This is to illustrate the increase in injuries when the NFL added a 17th game in 2021
injuries_per_year_16_line <- ggplot(injuries_per_year_df_16, aes(x = Season, y = Injuries)) +
  geom_line(color = "blue", group = 1, linewidth = 1) +
  geom_point(color = "blue", group = 1, size = 2.5) +
  labs(x = "Season", y = "Number of Injuries", title = "Injuries per Season")

#creating a data frame of injuries for only week 6 yes. In the article I isolated injuries for teams with week 6 byes when making predictions.
week_6_bye <- data.frame("injuries" = as.numeric(table(injuries_past_2016[injuries_past_2016$bye == 6,]$week)) / c(rep(bye_counts_past_16[6], 16), byes_21[6]), "week" = c(1:5, 7:18))

#creating 2 linear models to represent both the data before the bye and after the bye
week_6_model_after_bye <- lm(injuries ~ week, data = week_6_bye[week_6_bye$week > 6,])
week_6_model_before_bye <- lm(injuries ~ week, data = week_6_bye[week_6_bye$week < 6,])

#extrapolating week_6_model_after_bye to predict the effect of an 18th game (19th week) on injuries
week_6_week_19 <- data.frame(week = 19, injuries = predict(week_6_model_after_bye, newdata = data.frame(week = 19)))

#creating a dataframe to graph a line of best fit for the week_6_bye data
merged_regression_18 <- rbind(data.frame(week = 1:5, injuries = predict(week_6_model_before_bye, newdata = data.frame(week = 1:5))),  
                              data.frame(week = 7:18, injuries = predict(week_6_model_after_bye, newdata = data.frame(week = 7:18))))

#graphing the best-fit lines with the original week 6 data
regression_line_overlay_week_6 <- ggplot(week_6_bye, aes(x = week, y = injuries)) + 
  geom_line(aes(color = "Original Data for Teams with Week 6 Byes"), linewidth = 1) +
  geom_point(aes(color = "Original Data for Teams with Week 6 Byes"), size = 2.5) + 
  geom_line(data = merged_regression_18, aes(x = week, y = injuries, color = "Best Fit Lines"), linewidth = 0.7) +
  scale_x_continuous(breaks = week_6_bye$week) + 
  labs(x = "Week", y = "Number of Injuries", title = "Regression Line for Week 6 Byes", color = "Legend") + 
  scale_color_manual(values = c("Original Data for Teams with Week 6 Byes" = "blue", "Best Fit Lines" = "red")) +
  theme(
    legend.position.inside = c(0.87, 0.87), # Place the legend inside the plot area
    legend.title = element_text(size = 12), # Increase legend title size
    legend.text = element_text(size = 10), # Increase legend text size
    legend.key.size = unit(1.5, "lines"))

#graphing the effect of adding an extra (18th) game while keeping just 1 bye (graphing the prediction from the after_bye linear model)
week_6_projection_1_bye <- ggplot(week_6_bye, aes(x = week, y = injuries)) +
  geom_line(aes(color = "Original Data for Teams with Week 6 Byes"), linewidth = 1) +
  geom_line(data = rbind(week_6_bye[17,], week_6_week_19), aes(x = week, y = injuries, color = "Prediction for Game 18"), linewidth = 1) +
  geom_point(aes(color = "Original Data for Teams with Week 6 Byes"), size = 2.5) +
  geom_point(data = week_6_week_19, aes(x = week, y = injuries, color = "Prediction for Game 18"), size = 2.5) +
  geom_text(data = week_6_week_19, aes(x = week, y = injuries, label = round(injuries, 2), color = "Prediction for Game 18"), vjust = -1, show.legend = FALSE) + 
  scale_x_continuous(breaks = c(week_6_bye$week, 19)) +
  labs(x = "Week", y = "Number of Injuries", title = "Prediction of 18th Game with 1 Bye Week", color = "Legend") + 
  scale_color_manual(values = c("Prediction for Game 18" = "red", "Original Data for Teams with Week 6 Byes" = "blue")) +
  theme(
    legend.position.inside = c(0.87, 0.87), # Place the legend inside the plot area
    legend.title = element_text(size = 12), # Increase legend title size
    legend.text = element_text(size = 10), # Increase legend text size
    legend.key.size = unit(1.5, "lines"))

#finding how much the slope decreased from before the week 6 bye to after the week 6 bye. Finding the same thing for the immediate decrease in injury count.
slope_percent <- week_6_model_after_bye$coefficients[2] / week_6_model_before_bye$coefficients[2]

drop_percent <- week_6_bye$injuries[4] / week_6_bye$injuries[5]

#creating a model to mimic the effects observed by the week 6 bye on a future bye. We use this to predict the addition of a second bye week. 
model_change <- function(slope, intercept, weeks) {
  x <- slope_percent*slope
  y <- ((intercept + slope*(weeks[1] - 2)))*drop_percent
  data.frame("injuries" = (seq_along(weeks) - 1)*(x) + y, "week" = weeks)
}

#graphing the prediction for how a second bye week (in week 13) would impact the total number of injuries over an 18 game season (one additional game). Overlaying the original data and the 18 games, 1 bye prediction for comparison. 
second_bye_predict_overlay <- ggplot() +
  geom_line(data = rbind(week_6_bye[11, ], model_change(week_6_model_after_bye$coefficients[2], week_6_model_after_bye$coefficients[1], 14:20)),
            aes(x = week, y = injuries, color = "Prediction with Two Byes"), linewidth = 1) +
  geom_point(data = rbind(week_6_bye[11, ], model_change(week_6_model_after_bye$coefficients[2], week_6_model_after_bye$coefficients[1], 14:20)),
             aes(x = week, y = injuries, color = "Prediction with Two Byes"), size = 2.5) +
  geom_line(data = rbind(week_6_bye[17, ], week_6_week_19),
            aes(x = week, y = injuries, color = "Prediction with One Bye"), linewidth = 1) +
  geom_point(data = week_6_week_19,
             aes(x = week, y = injuries, color = "Prediction with One Bye"), size = 2.5) +
  geom_line(data = week_6_bye,
            aes(x = week, y = injuries, color = "Original Data for Teams with Week 6 Byes"), linewidth = 1) +
  geom_point(data = week_6_bye,
             aes(x = week, y = injuries, color = "Original Data for Teams with Week 6 Byes"), size = 2.5) +
    scale_x_continuous(breaks = 1:20) +
  labs(x = "Week", y = "Number of Injuries",
       title = "Number of Injuries per Team - Comparison for Predictions with 1 and with 2 Byes",
       color = "Legend") +
  scale_color_manual(values = c("Prediction with Two Byes" = "purple",
                                "Prediction with One Bye" = "red",
                                "Original Data for Teams with Week 6 Byes" = "blue")) +
  theme(
    legend.position.inside = c(0.87, 0.87),
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10),
    legend.key.size = unit(1.5, "lines")
  )

#counting the total injuries for each of our predictions and our original data (for a single team across an entire season).
second_bye_predict_sum <- sum(rbind(week_6_bye[week_6_bye$week < 13, ], model_change(week_6_model_after_bye$coefficients[2], week_6_model_after_bye$coefficients[1], 14:20))$injuries)
one_bye_predict_sum <- sum(rbind(week_6_bye, week_6_week_19)$injuries)
week_6_sum <- sum(week_6_bye$injuries)

#merge the total injuries for each case into a dataframe. Multiply by 32 to make it the league-wide number of injuries in a season, not just for one team.
injuries_from_first_prediction <- data.frame(total_injuries = round(32*c(week_6_sum, one_bye_predict_sum, second_bye_predict_sum)), from = c("Original Week 6 Data", "Prediction with One Bye and 18 Games", "Prediction with Two Byes and 18 Games"))
injuries_from_first_prediction$from <- factor(injuries_from_first_prediction$from, levels = injuries_from_first_prediction$from)

#Graph the total injuries on a bar plot
first_predict_bar <- ggplot(data = injuries_from_first_prediction, aes(x = from, y = total_injuries, fill = from)) +
  geom_bar(stat = "identity", width = 0.5) +
  geom_text(aes(label = round(total_injuries, 2)), vjust = -0.3, color = "black", size = 5) +
  labs(x = "", y = "Number of Injuries Across the NFL Each Season", title = "League-Wide Injury Totals for Our Predictions") +
  scale_fill_manual(values = c("Original Week 6 Data" = "darkblue", "Prediction with One Bye and 18 Games" = "darkred", "Prediction with Two Byes and 18 Games" = "darkmagenta")) +
  theme(legend.position = "none", axis.text.x = element_text(size = 14, color = "black"))

#creating a linear model of before and after the bye week from the week_diff data frame. This is for comparing the observed slope from the general week_diff data to the case of just week 6 byes
before_bye_prediction_df <- data.frame(week = 1:12, injuries = diff_16_df[2:13,]$injury_count)

before_bye_model <- lm(injuries ~ week, data = before_bye_prediction_df)
after_bye_model <- lm(injury_count ~ week_diff, data = diff_16_df[14:25,])

#The above models indicate that there was a larger decrease in slope in week 6 than in general. This new_model_change will ensure the total number of injuries are not underestimated due to this.
#This time, the function will only apply the same immediate drop percent for the second bye and will make no adjustments to the slope. 
new_model_change <-function(slope, intercept, weeks) {
  x <- slope
  y <- ((intercept + slope*(weeks[1] - 2)))*drop_percent
  data.frame("injuries" = (seq_along(weeks) - 1)*(x) + y, "week" = weeks)
}

#creating a dataframe for this revised prediction.
final_predict <- rbind(week_6_bye[week_6_bye$week < 13,], new_model_change(week_6_model_after_bye$coefficients[2], week_6_model_after_bye$coefficients[1], 14:20))

#graphing this revised prediction. Overlaying the original data and the 18 games, 1 bye prediction for comparison. 
final_bye_predict_overlay <- ggplot() +
  geom_line(data = final_predict,
            aes(x = week, y = injuries, color = "Revised Prediction with Two Byes"), linewidth = 1) +
  geom_point(data = final_predict,
             aes(x = week, y = injuries, color = "Revised Prediction with Two Byes"), size = 2.5) +
    geom_line(data = rbind(week_6_bye[17, ], week_6_week_19),
            aes(x = week, y = injuries, color = "Prediction with One Bye"), linewidth = 1) +
  geom_point(data = week_6_week_19,
             aes(x = week, y = injuries, color = "Prediction with One Bye"), size = 2.5) +
    geom_line(data = week_6_bye,
            aes(x = week, y = injuries, color = "Original Data for Teams with Week 6 Byes"), linewidth = 1) +
  geom_point(data = week_6_bye,
             aes(x = week, y = injuries, color = "Original Data for Teams with Week 6 Byes"), size = 2.5) +
  scale_x_continuous(breaks = 1:20) +
  labs(x = "Week", y = "Number of Injuries",
       title = "Number of Injuries per Team - Revised Comparison for Predictions with 1 and with 2 Byes",
       color = "Legend") +
  scale_color_manual(values = c("Revised Prediction with Two Byes" = "darkgreen",
                                "Prediction with One Bye" = "red",
                                "Original Data for Teams with Week 6 Byes" = "blue")) +
  theme(
    legend.position = c(0.87, 0.87),
    legend.title = element_text(size = 12),
    legend.text = element_text(size = 10),
    legend.key.size = unit(1.5, "lines")
  )

#counitng the total injuries for a single team across an entire season for this revised prediction.
final_predict_sum <- sum(final_predict$injuries)

#making a dataframe of the number of injuries across the league for an entire season for this revised prediction, the original data, and the 18 games, 1 bye prediction
injuries_from_second_prediction <- data.frame(total_injuries = round(32*c(week_6_sum, one_bye_predict_sum, final_predict_sum)), from = c("Original Week 6 Data", "Prediction with One Bye and 18 Games", "Revised Prediction with Two Byes and 18 Games"))

#ordering levels so the next bar chart is ordered similarly to the first one
injuries_from_second_prediction$from <- factor(injuries_from_second_prediction$from, levels = injuries_from_second_prediction$from)

#creating a bar chart of the injury counts for the revised prediction, the original data, and the 18 games, 1 bye prediction
second_predict_bar <- ggplot(data = injuries_from_second_prediction, aes(x = from, y = total_injuries, fill = from)) +
  geom_bar(stat = "identity", width = 0.5) +
  geom_text(aes(label = round(total_injuries, 2)), vjust = -0.3, color = "black", size = 5) +
  labs(x = "", y = "Number of Injuries Across the NFL Each Season", title = "Revised League-Wide Injury Totals for Our Predictions") +
  scale_fill_manual(values = c("Original Week 6 Data" = "darkblue", "Prediction with One Bye and 18 Games" = "darkred", "Revised Prediction with Two Byes and 18 Games" = "darkgreen")) +
  theme(legend.position = "none", axis.text.x = element_text(size = 14, color = "black"))