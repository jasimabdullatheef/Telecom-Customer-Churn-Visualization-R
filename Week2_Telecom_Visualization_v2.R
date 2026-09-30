# Week 2 - Telecom Customer Churn Visualization

# Load libraries
library(ggplot2)
library(dplyr)

# Set working directory
setwd("C:/Users/USER/OneDrive/Desktop/YuvaIntern_Week2_Telecom_Visualization")

# Load dataset
data <- read.csv("telecom_customer_churn.csv")

# Check dataset
dim(data)
head(data)
str(data)


# Visualization 1: Customer Status Distribution

ggplot(data, aes(x = Customer.Status)) +
  geom_bar() +
  labs(
    title = "Customer Status Distribution",
    x = "Customer Status",
    y = "Number of Customers"
  ) +
  theme_minimal()


# Visualization 2: Age Distribution

ggplot(data, aes(x = Age)) +
  geom_histogram(bins = 20) +
  labs(
    title = "Age Distribution of Customers",
    x = "Age",
    y = "Number of Customers"
  ) +
  theme_minimal()


# Visualization 3: Monthly Charge vs Total Revenue

ggplot(data, aes(x = Monthly.Charge, y = Total.Revenue)) +
  geom_point(alpha = 0.5) +
  labs(
    title = "Monthly Charge vs Total Revenue",
    x = "Monthly Charge",
    y = "Total Revenue"
  ) +
  theme_minimal()


# Visualization 4: Contract Type vs Customer Status

ggplot(data, aes(x = Contract, fill = Customer.Status)) +
  geom_bar(position = "dodge") +
  labs(
    title = "Customer Status by Contract Type",
    x = "Contract Type",
    y = "Number of Customers",
    fill = "Customer Status"
  ) +
  theme_minimal()


# Visualization 5: Average Total Revenue by Customer Tenure

tenure_summary <- data %>%
  group_by(Tenure.in.Months) %>%
  summarise(
    Average_Revenue = mean(Total.Revenue, na.rm = TRUE)
  )

ggplot(tenure_summary, aes(x = Tenure.in.Months, y = Average_Revenue)) +
  geom_line() +
  labs(
    title = "Average Total Revenue by Customer Tenure",
    x = "Tenure in Months",
    y = "Average Total Revenue"
  ) +
  theme_minimal()


# Visualization 6: Churn Category Distribution

churned_data <- data[data$Customer.Status == "Churned", ]

ggplot(churned_data, aes(x = Churn.Category)) +
  geom_bar() +
  labs(
    title = "Churn Category Distribution",
    x = "Churn Category",
    y = "Number of Churned Customers"
  ) +
  theme_minimal()
