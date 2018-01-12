library(ggplot2)
library(earlywarnings)
library(microbiome)

setwd("/Users/villelaitinen/Desktop/PhD/early_warning_signals/")
load(file = "data-Ravel2012/data.clr.rda")

data10 <- subset(time.matrix.clr, grepl("-10", row.names(time.matrix.clr)) & rowSums(time.matrix.clr) !=0)

plot(data10["Atopobium-10",])
id10_early <- data.frame(data10["Atopobium-10",1:54])
colnames(id10_early) <- c('y')

##EWS package functions:
#general, includes ar1, sd, kurtosis, skewness, cv, return rate, density ratio
generic_ews(id10_early, detrending = "gaussian", AR_n = FALSE, powerspectrum = FALSE)

#BDS test, error
bdstest_ews(exp(id10_early))

# conditional heteroskedasticity, exponention removes error.. 
ch_ews(id10_early)

# drift diffusion jump non-parametrics
ddjnonparam_ews(id10_early)

# find optima
# find.optima(density)

# potential analysis
livpotential_ews(id10_early[,1])

# moving average potential
# movpotential_ews()
# plot pontential from the former
# PlotPontential()

# quick detection analysis, error
qda_ews(id10_early)

# sensitivity ews, error
sensitivity_ews(id10_early, detrending = "gaussian")

# surrogate ews, error
surrogates_ews(id10_early)

#Univariate grouping
#UnivariateGrouping(id10_early, breakpoints)

