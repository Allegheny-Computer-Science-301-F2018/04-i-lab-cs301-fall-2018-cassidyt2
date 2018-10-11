# Name:
# Date:

# Run the below only if the library is not already installed.
# install.packages(dslabs)

library(dslabs)
library(dplyr)
library(tidyverse)
data(us_contagious_diseases)

#Question 1.
diseases <- us_contagious_diseases
dat <- filter(diseases, diseases$disease == "Measles", !(diseases$state == "Alaska" | diseases$state == "Hawaii"))
ratePerHundredK <- mutate(dat, rate = (((dat$count * 100000)/dat$population) * (dat$weeks_reporting/52)))

#Question 2.
caliMeasles <- filter(ratePerHundredK, ratePerHundredK$state == "California")
ggplot(data = caliMeasles) +
     geom_point(mapping = aes(x = caliMeasles$year, y = caliMeasles$rate)) +
     geom_smooth(mapping = aes(x = caliMeasles$year, y = caliMeasles$rate), se = FALSE) +
     geom_vline(xintercept = 1965)
##Task Two Justification: Needed to use the rate object I'd already created to get the rates in this
##new california only object. Added the vertical line at 1965 when the vaccine was introduced.
##I included a geom_smooth line to better show the trend of the data, which seems a little scattered at first.

#Question 3.
dat_caliFocus <- filter(us_contagious_diseases, state == "California", year %in% c(1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979))
dat_caliFocus$yearBlock[dat_caliFocus$year == 1950 | dat_caliFocus$year == 1951 | dat_caliFocus$year == 1952 | dat_caliFocus$year == 1953 | dat_caliFocus$year == 1954 | dat_caliFocus$year == 1955 | dat_caliFocus$year == 1956 | dat_caliFocus$year == 1957 | dat_caliFocus$year == 1958 | dat_caliFocus$year == 1959] <- "1950's"
dat_caliFocus$yearBlock[dat_caliFocus$year == 1960 | dat_caliFocus$year == 1961 | dat_caliFocus$year == 1962 | dat_caliFocus$year == 1963 | dat_caliFocus$year == 1964 | dat_caliFocus$year == 1965 | dat_caliFocus$year == 1966 | dat_caliFocus$year == 1967 | dat_caliFocus$year == 1968 | dat_caliFocus$year == 1969] <- "1960's"
dat_caliFocus$yearBlock[dat_caliFocus$year == 1970 | dat_caliFocus$year == 1971 | dat_caliFocus$year == 1972 | dat_caliFocus$year == 1973 | dat_caliFocus$year == 1974 | dat_caliFocus$year == 1975 | dat_caliFocus$year == 1976 | dat_caliFocus$year == 1977 | dat_caliFocus$year == 1978 | dat_caliFocus$year == 1979] <- "1970's"
ggplot(data = dat_caliFocus ) + geom_bar(mapping = aes(x = state, y = sqrt(count), fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))
ggplot(data = dat_caliFocus ) + geom_bar(mapping = aes(x = state, y = count, fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))
## Now doing a histogram by year, not state. 
ggplot(data = dat_caliFocus ) + geom_histogram(mapping = aes(x = year, y = sqrt(count), fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))
ggplot(data = dat_caliFocus ) + geom_histogram(mapping = aes(x = year, y = count, fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))
##Code justification: made an object containing only california data from 1950-1979. Plotted it and colored it by decade. Then wrote code for a histogram that could be used to compare state and decade then code to do year and decade.

#Question 4.
threeDec <- filter(us_contagious_diseases, year %in% c(1950, 1951, 1952, 1953, 1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979))
threeDec$yearBlock[threeDec$year == 1950 | threeDec$year == 1951 | threeDec$year == 1952 | threeDec$year == 1953 | threeDec$year == 1954 | threeDec$year == 1955 | threeDec$year == 1956 | threeDec$year == 1957 | threeDec$year == 1958 | threeDec$year == 1959] <- "1950's"
threeDec$yearBlock[threeDec$year == 1960 | threeDec$year == 1961 | threeDec$year == 1962 | threeDec$year == 1963 | threeDec$year == 1964 | threeDec$year == 1965 | threeDec$year == 1966 | threeDec$year == 1967 | threeDec$year == 1968 | threeDec$year == 1969] <- "1960's"
threeDec$yearBlock[threeDec$year == 1970 | threeDec$year == 1971 | threeDec$year == 1972 | threeDec$year == 1973 | threeDec$year == 1974 | threeDec$year == 1975 | threeDec$year == 1976 | threeDec$year == 1977 | threeDec$year == 1978 | threeDec$year == 1979] <- "1970's"
##Creating histogram w/ sqrt(count)
ggplot(data = threeDec ) + geom_histogram(mapping = aes(x = year, y = sqrt(count), fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))
##Creating histogram w/o sqrt(count)
ggplot(data = threeDec ) + geom_histogram(mapping = aes(x = year, y = count, fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))

#Question 5.
threeDecRatePerHundredK <- mutate(threeDec, rate = (((threeDec$count * 100000)/threeDec$population) * (threeDec$weeks_reporting/52)))
##Making Geom_tile with state as Y
ggplot(data = threeDecRatePerHundredK, mapping = aes(x = year, y = state)) +
     geom_tile(mapping = aes(fill = rate))
##Justification: I put states on the Y because it made more sense for visualization, and I redid the rates because I needed to do that for the whole country data set. 

#Question 6.
##I could only find data from 1986-2007. 
autRates <- read.csv("~/Downloads/autism_rates_86-07.csv")
   View(autRates)
ggplot(data = autRates) +
     geom_point(mapping = aes(x = autRates$Year., y = autRates$Entered.System))
##This shows that autism increased from 1986-1987. But there is something else at play too.
##The wrongful diagnosis of autism decreased. The increase was not entirely MORE people with autism, it was more CORRECT DIAGNOSIS of autism.
##The added diagnosis plot shows the number of people who had diagnosis SWITCHED to autism. 
autRatePercs <- mutate(autRates, 
                    percAdd = autRates$Added.Diagnoses / autRates$Year.Start.Population)
autRatePercsTotal <- mutate(autRatePercs,percOfEnteredAdded = autRatePercs$Added.Diagnoses / autRatePercs$Entered.System)
ggplot(data = autRatePercsTotal) +
     geom_point(mapping = aes(x = Year., y = autRatePercsTotal$percOfEnteredAdded))
##This plot shows the decrease in Misdiagnosis by percentage of total diagnoses per year.
##Although there is the trend of diseases decreasing but autism increasing, this correlation is not due to causation.


##Code Task 7: Do diseases other than measles have enough data to explore the effects of vaccines?
notMeas <- filter(us_contagious_diseases, !(us_contagious_diseases$disease == measles))
notMeasRatePerHundredK <- mutate(notMeas, rate = (((notMeas$count * 100000)/notMeas$population) * (notMeas$weeks_reporting/52)))
ggplot(data = notMeasRatePerHundredK) +
     geom_point(mapping = aes(x = notMeasRatePerHundredK$year, y = notMeasRatePerHundredK$count, color = notMeasRatePerHundredK$disease))
##The simple answer: yes. All have disease rates with a downward trend similar to measles.





