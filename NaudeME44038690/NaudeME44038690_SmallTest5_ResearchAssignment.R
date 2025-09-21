#NaudeME44038690_SmallTest5_ResearchAssignment
rm(list=ls())
cat("\014")
setwd("C:\\Users\\marli\\OneDrive\\NWU\\Bsc Business Analytics\\_3rd Year\\STTN326\\Assignment\\Naude_44038690_SmallTest5ResearchAssignment")
#libraries
#install.packages("tseries")
#install.packages("urca")
#install.packages("forecast")
#install.packages("lubridate")
library(tseries)
library(urca)
library(forecast)
library(ggplot2)
library(lubridate)
library(dplyr)

#Read in data
temp_London<-read.csv("london_temperature.csv")
head(temp_London)

#Convert data into a time series
temps <- as.numeric(temp_London$Temperature_C)
temps_ts <- ts(temps, start = c(2024, 1), frequency = 365)

#Question 1
plot(temps_ts, main="Temperature for London", ylab="Temperature", xlab="Date", col="violetred1")

#Question 2
#2.1
(adf_test <- adf.test(temps_ts))

#2.2
#2.2.1
time<- 1:length(temps_ts)
mylm<- lm(temps_ts~time)
detrend<- resid(mylm)
plot(detrend,main="Detrended Temperature for London", ylab="Residuals", col="violetred2")

#2.2.2
diff_temp <- diff(temps_ts)
plot(diff_temp, main="Differenced Temperature", col= "violetred3")

#2.2.3
log_temp <- log(temps_ts)
diff_log_temp <- diff(log_temp)
plot(diff_log_temp, main="Log-Differenced Temperature", col= "violetred4")

#2.3
myrw<- ur.df(temps_ts, type="none", selectlags = "AIC")
summary(myrw)

#2.4
myrwd<- ur.df(temps_ts, type="drift", selectlags = "AIC")
summary(myrwd)

#Question 3
#3.1
acf(temps_ts, main="ACF of Temperature",col= "violetred")
pacf(temps_ts, main="PACF of Temperature",col= "deeppink")

#3.3
fit <- auto.arima(temps_ts)
res <- residuals(fit)
acf(res, main = "ACF of Residuals",col= "deeppink1")
Box.test(res, lag = 20, type = "Ljung-Box")#since it considered a small sample


#Question 4
#4.1
fit <- auto.arima(temps_ts)
summary(fit)

#4.2
#MoM
fit_mom<- ar(temps_ts, order.max=1, method="yw")  
summary(fit_mom)
fit_mom$ar

#MLE
fit_mle <- auto.arima(temps_ts, method = "ML")
summary(fit_mle)
fit_mle$coef

#LS
fit_ls <- arima(temps_ts, order = c(0,1,1), method = "CSS")
summary(fit_ls)
fit_ls$coef

#4.3
qqnorm(res)
qqline(res)


#Question 5
# 5.1 
fc <- forecast(fit, h = 20)
# Convert Date column to Date type
temp_London$Date <- as.Date(temp_London$Date)

# Generate next 20 daily dates after the last observation
future_dates <- seq(from = max(temp_London$Date) + 1,by = "day", length.out = 20)

(fc_df <- data.frame(Date= future_dates,Forecast = as.numeric(fc$mean),Lo95= fc$lower[,2],Hi95= fc$upper[,2]))



# 5.2
ggplot() +
  # Historical temps
  geom_line(data = temp_London, aes(x = Date, y = Temperature_C),color = "deeppink2") +
  # Forecast line
  geom_line(data = fc_df, aes(x = Date, y = Forecast),color = "black") +
  geom_ribbon(data = fc_df, aes(x = Date, ymin = Lo95, ymax = Hi95),fill = "lightblue", alpha = 0.4) +
  labs(title = "London Temperature Forecast (next 20 days)",x = "Date", y = "Temperature (°C)")

#5.3
mean(fc_df$Lo95)
mean(fc_df$Hi95)
