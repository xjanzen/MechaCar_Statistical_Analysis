library(dplyr)

df <- read.csv(file="MechaCar_mpg.csv")
head(df)

model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, df)
model

mpg_summary <- summary(model)
mpg_summary



susp_coil_df <- read.csv(file="Suspension_Coil.csv")
head(susp_coil_df)

total_summary <- susp_coil_df %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI),)
total_summary

lot_summary <- susp_coil_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI),)
lot_summary



t.test(subset(susp_coil_df,select=PSI),mu = 1500)

t.test(subset(susp_coil_df,Manufacturing_Lot=="Lot1",PSI),mu = 1500)
t.test(subset(susp_coil_df,Manufacturing_Lot=="Lot2",PSI),mu = 1500)
t.test(subset(susp_coil_df,Manufacturing_Lot=="Lot3",PSI),mu = 1500)
