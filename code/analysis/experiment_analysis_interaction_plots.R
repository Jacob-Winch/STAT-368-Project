library(car)

distance = c(245, 247, 241,
             248, 258, 249,
             247, 232, 240, 
             246, 212, 226,
             236, 240, 248,
             247, 234, 238,
             192, 249, 253,
             245, 249, 220,
             242, 227, 235,
             259, 248, 231,
             254, 243, 241,
             249, 244, 237,
             264, 265, 249,
             244, 255, 244,
             220, 231, 258,
             221, 249, 253,
             228, 264, 250,
             282, 260, 275,
             251, 240, 255,
             244, 252, 255,
             259, 276, 277,
             264, 287, 275,
             256, 256, 265,
             230, 224, 252, 
             241, 255, 254,
             260, 266, 264,
             261, 255, 275)

driver = as.factor(rep(c("R7", "M5", "Stealth 2 Plus"), each = 27))

golf_ball = as.factor(rep(c("Soft Response", "Tour Response", "TP5"), each = 9, times = 3))

golf_ball_number = as.factor(rep(c(1:3), times = 9, each = 3))

model = lm(distance~(driver + golf_ball)^2 + 
             (golf_ball_number + driver*golf_ball_number)%in%golf_ball)

#Box Cox 
bc = boxcox(model)
alpha = bc$x[which.max(bc$y)]

transformed_distance = (distance^(alpha)-1)/alpha

transformed_model = lm(transformed_distance~(driver + golf_ball)^2 + 
                         (golf_ball_number + driver*golf_ball_number)%in%golf_ball)


windows()
interaction.plot(driver, golf_ball, distance, col = c(3,4),main = "Driver and Golf Ball Interaction", xlab = "Driver", ylab ="Mean of Distance")
interaction.plot(golf_ball, golf_ball_number, distance, col = c(3,4),main = "Golf Ball and Golf Ball Number Interaction", xlab = "Golf Ball", ylab ="Mean of Distance")
interaction.plot(driver, golf_ball_number, distance, col = c(3,4),,main = "Driver and Golf Ball Number Interaction", xlab = "Driver", ylab ="Mean of Distance")



