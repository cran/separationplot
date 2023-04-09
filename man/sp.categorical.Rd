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
\references{Greenhill, Brian, Michael D. Ward, and Audrey Sacks. "The separation plot: A new visual method for evaluating the fit of binary models." American Journal of Political Science 55.4 (2011): 991-1002.}

\author{
Brian Greenhill <\email{bgreenhill@albany.edu}>}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
See \code{\link{separationplot}} for a description of the core function for generating separation plots.
}
\examples{

# This example borrows code from the example given in the documentation for the polr() function 
# that uses the "housing" dataset:
options(contrasts = c("contr.treatment", "contr.poly"))
house.plr <- polr(Sat ~ Infl + Type + Cont, weights = Freq, data = housing)

sp.categorical(pred=house.plr$fitted.values,
actual=as.character(house.plr$model[,1]), type="rect", lwd2=2)
 # not a very good fit!


}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ sp.categorical }
