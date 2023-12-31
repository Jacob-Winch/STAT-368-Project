library(MASS)
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

anova(transformed_model)

anova_model = anova(transformed_model)

ms = as.vector(anova_model[[3]])
MS_driver <- ms[1]
MS_golf_ball <- ms[2]
MS_driver_golf_ball <- ms[3]
MS_golf_ball_golf_ball_number <- ms[4]
MS_driver_golf_ball_golf_ball_number <- ms[5]
MSE <- ms[6]

df = as.vector(anova_model[[1]])
df_driver <- df[1]
df_golf_ball <- df[2]
df_driver_golf_ball <- df[3]
df_golf_ball_golf_ball_number <- df[4]
df_driver_golf_ball_golf_ball_number <- df[5]
df_E <- df[6]

F_driver <- MS_driver/MS_driver_golf_ball_golf_ball_number
F_golf_ball <- MS_golf_ball/MS_golf_ball_golf_ball_number
F_driver_golf_ball <- MS_driver_golf_ball/MS_driver_golf_ball_golf_ball_number
F_golf_ball_golf_ball_number <- MS_golf_ball_golf_ball_number/MSE
F_driver_golf_ball_golf_ball_number <- MS_driver_golf_ball_golf_ball_number/MSE

p_driver = 1-pf(F_driver, df_driver, df_driver_golf_ball_golf_ball_number)
p_golf_ball = 1-pf(F_golf_ball, df_golf_ball, df_golf_ball_golf_ball_number)
p_driver_golf_ball = 1-pf(F_driver_golf_ball, df_driver_golf_ball, df_driver_golf_ball_golf_ball_number)
p_golf_ball_golf_ball_number = 1-pf(F_golf_ball_golf_ball_number, df_golf_ball_golf_ball_number, df_E)
p_golf_driver_ball_golf_ball_number = 1-pf(F_driver_golf_ball_golf_ball_number, df_driver_golf_ball_golf_ball_number, df_E)

