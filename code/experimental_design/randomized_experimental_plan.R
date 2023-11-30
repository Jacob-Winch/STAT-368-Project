set.seed(73)

drivers = as.factor(rep(c("R7", "M5", "Stealth 2 Plus"), each = 27))

golf_balls = as.factor(rep(c("Soft Response", "Tour Response", "TP5"), each = 9, times = 3))

golf_ball_number = as.factor(rep(c(1:3), times = 3, each = 3))

trial = rep(c(1:27), each = 3)

experimental_plan = data.frame(drivers, golf_balls, golf_ball_number, trial)

randomized_trial = sample(unique(trial))

randomized_trial_order = unlist(sapply(randomized_trial, function(x) which(trial == x)))

randomized_experimental_plan = experimental_plan[randomized_trial_order, ]

randomized_experimental_plan




