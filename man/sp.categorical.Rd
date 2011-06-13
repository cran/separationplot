\name{sp.categorical}
\alias{sp.categorical}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Separation plots for variables with more than two outcome levels}
\description{
This function generates separation plots for polytomous dependent variables.
}
\usage{
sp.categorical(pred, actual, file = NULL, cex = 1.5, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{pred}{
A matrix of fitted values.  Each row represents one observation, and each column represents the probability of obtaining that outcome.  The column names correspond to the outcome categories.}
  \item{actual}{
A vector containing the actual outcomes corresponding to each observation.}
  \item{file}{
The name and file path of where the pdf output should be written, if desired. If \code{file=NULL} the output will be written to the screen.}
  \item{cex}{
Character expansion factor used for the outcome category labels.}
  \item{\dots}{
Additional arguments passed to \code{\link{separationplot}}.
}
}
\details{
This function is a wrapper for \code{\link{separationplot}} that generates a series of separation plots for each outcome category for a variable with more than two outcomes.

Please see the paper by Greenhill, Ward and Sacks for more information on the features of the separation plot.}
\value{
None.  This function is used for its side effects only.
}
\references{
Contact Brian Greenhill <\email{brian.d.greenhill@dartmouth.edu}> for a copy of the paper by Greenhill, Ward and Sacks that explains the concept of the separation plot.}
\author{
Brian Greenhill <\email{brian.d.greenhill@dartmouth.edu}>}
\note{
This function is still being developed.  Please contact Brian Greenhill with any questions or comments.}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
See \code{\link{separationplot}} for a description of the core function for generating separation plots.
}
\examples{
\donttest{

# Example using an ordered probit model from Neumayer (2005) "Do international human rights
# treaties improve respect for human rights?"  Journal of Conflict Resolution, 49 (6), 2005,
# pp. 925-953 

library(foreign) 
library(MASS)

neumayer<-read.dta("http://www2.lse.ac.uk/dataFiles/geographyAndEnvironment/Replication/Article\%20for\%20JCR\%20(Human\%20Rights).dta")

# create a new dataframe called "data4" that just contains the variables we're interested in (and with simpler names).
data6<-na.omit(data.frame(DV=neumayer$aipts, laggedDV=neumayer$laipts, rat=neumayer$iccprmainrat, ingo.pc=neumayer$wiikngointerpc, dem=neumayer$politycorr020, extwar=neumayer$uppsalaexternalincountry, civwar=neumayer$uppsalainternal, gdp=neumayer$lngdp1995pc, pop=neumayer$lnpop, country=neumayer$country, year=neumayer$year))

# run the model (note that this is Model 6 of Table 2 of the published paper):
model6<-polr(as.ordered(DV)~laggedDV +rat + rat:ingo.pc + rat:dem +ingo.pc  +dem +extwar +civwar+gdp +pop, data=data6, Hess=T, method="probit")
summary(model6) 

sp.categorical(pred=model6$fitted.values, actual=as.character(model6$model[,1]), cex=2.5)

}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{sp.categorical}
