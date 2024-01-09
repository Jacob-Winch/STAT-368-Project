# STAT-368-Project

## Abstract
Our objective is to determine if spending more money on golf balls and drivers would result in a greater distance achieved when hitting a ball off of a tee. To do so, we ran a randomized nested-factorial experiment where we tested three golf balls nested within three different models of golf balls all from Taylormade Golf Company. This created three groups of golf balls with each group containing three of the same type of ball. We also tested three drivers all from Taylormade Golf Company. The price point of each of the three types of golf balls and each of the three drivers represented our factors (low, medium, high). To record data, we used a Garmin R10 launch monitor to measure the drives taken at an indoor driving range and had one experienced golfer perform each drive. It was determined that the most significant factors were the price points of the drivers, the golf ball within the golf ball price, and the golf ball within the golf ball price interacting with the driver. When comparing the effect of the driver factor, we concluded that there was a significant difference between the high-end and low-end drivers, but there was not a significant difference between the high-end and the medium-end drivers as well as the medium-end and the low-end drivers. Our results show that spending more money on a driver is likely to improve the distance the ball travels, whereas spending more money on a ball has neither a positive nor negative effect on the distance travelled.
## Repository Directory

### code
  - methodology: Code used in the methodology section of our report.
      - [`entering_experiment_data.R`](https://github.com/Jacob-Winch/STAT-368-Project/blob/main/code/methodology/entering_experiment_data.R): R script to enter experimental data into a dataframe.
      - [`randomized_experimental_plan.R`](https://github.com/Jacob-Winch/STAT-368-Project/blob/main/code/methodology/randomized_experimental_plan.R): R script to generate a random experimental plan.

  - results: Code used in the results section of our report.
      - [`P-values for factors.R`](https://github.com/Jacob-Winch/STAT-368-Project/blob/main/code/results/P-values%20for%20factors.R): R script to determine P-values for factors to determine which factors are significant.
      - [`experiment_ANOVA.R`](https://github.com/Jacob-Winch/STAT-368-Project/blob/main/code/results/experiment_ANOVA.R): R script to generate an ANOVA table for the experiment.
      - The rest of the R scripts are used to generate plots and test to analyze assumptions.
    

  - results: Code used in the results section of our report. 
### data
  -[`data_spreadsheet.csv`](https://github.com/Jacob-Winch/STAT-368-Project/blob/main/data/data_spreadsheet.csv): Our experimental data.
  
### photos
  - Some photos from our experiment that were used in our report.

### [`Can Money Buy You Distance: An Examination of the Effect of Price on the Driving Performance of Golf Equipment`](https://github.com/Jacob-Winch/STAT-368-Project/blob/main/Can%20Money%20Buy%20You%20Distance.pdf): Our Report
