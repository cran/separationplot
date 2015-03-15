\name{separationplot}
\alias{separationplot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Generate a Separation Plot}
\description{
This is the core function for the generation of a separation plot.
}
\usage{
separationplot(pred, actual, type = "line", line = T, lwd1 = 0.5, lwd2 = 0.5,
               heading = "",  xlab = "", shuffle = T, width = 9, height = 1.2,
               col0 = "#FEF0D9", col1 = "#E34A33", flag = NULL, flagcol = 1,
               file = NULL, newplot = T, locate = NULL, rectborder = NA,
               show.expected = F, zerosfirst = T, BW = F)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{pred}{
Vector of predicted probabilities (on a continuous 0 to 1 scale).
}
  \item{actual}{
Vector of actual outcomes (each element must be either 0 or 1).}
  \item{type}{
Should the individual lines on the separation plot be plotted as line segments (\code{type="line"}) or rectangles (\code{type="rect"}), or should the probabilities in different regions of the plot be grouped into distinct bands (\code{type="bands"})?}
  \item{line}{
Should a trace line be added to the plot?}
  \item{lwd1}{
The width of the individual line segments (only when \code{type="line"}).}
  \item{lwd2}{
The width of the trace line (only when \code{line=T}).}
  \item{heading}{
An optional title for the plot.}
  \item{xlab}{
An option x-axis label.}
  \item{shuffle}{
If \code{shuffle=T}, the order of rows in the results data is randomized to break up any pre-existing patterns that may distort the appearance of the results in the special case where many of the observations share the same fitted values.  This happens, for example, when the original dataframe is organized in such a way that all the cases with the event of interest come before the cases without the event.  Note that when \code{shuffle=T}, the random number seed is reset to 1 each time this function is called.  This ensures that replicable results can be obtained even when the order of observations is randomized.}
  \item{width}{
Width of the plot space (in inches).}
  \item{height}{
Height of the plot space (in inches).}
  \item{col0}{
Color of the predicted probabilities corresponding to 0s in the \code{actual} vector.  The default color has been chosen from one of the palettes on \url{http://colorbrewer2.org/}.}
  \item{col1}{
Color of the predicted probabilities corresponding to 1s in the \code{actual} vector.  The default color has been chosen from one of the palettes on \url{http://colorbrewer2.org/}.}
  \item{flag}{
A vector of row number(s) in the \code{actual} vector corresponding to the observations to flag.}
  \item{flagcol}{
A vector of colors for the flags.}
  \item{file}{
The name and file path of where the pdf output should be written, if desired. If \code{file=NULL} the output will be written to the screen.}
  \item{newplot}{
Should a new plotting space be opened up for the separation plot?  Select \code{newplot=F} if you want the separation plot to be added to currently open output device.}
  \item{locate}{
Number of lines (if any) on the separation plot that you want to identify with the mouse using the \code{locator} function.}
  \item{rectborder}{
When \code{type="rect"}, the value of this argument is passed to the \code{border} argument of the \code{rect} function used to draw the line segments.  The default setting (\code{rectborder=NA}) suppresses the drawing of borders around the individual segments of the plot.}
  \item{show.expected}{
If \code{show.expected=T}, a marker is added to the plot showing the expected total number of events.  The expected number of events is calculated by simply summing (and rounding) the predicted probabilities over all observations. }
  \item{zerosfirst}{
When \code{type="line"}, should the 0s be plotted in the background, and the 1s in the foreground, or vice-versa?  This will affect the output when the number of observations is very large relative to the size of the plot.}
  \item{BW}{
Should the Black and White color scheme be implemented?}
}
\details{
Please see the paper by Greenhill, Ward and Sacks for more information on the features of the separation plot.}
\value{

  \item{resultsmatrix }{The dataframe containing the data used to generate the separation plot.  The first column is the vector of predicted probabilities, the second is the vector of actual outcomes, the third indicates which observations have been flagged using the \code{flag} argument above, the fourth gives the position of each observation on the horizontal axis of the separation plot, and the fifth gives the color used to plot each observation. }
}
\references{
Contact Brian Greenhill <\email{brian.d.greenhill@dartmouth.edu}> for a copy of the paper by Greenhill, Ward and Sacks that explains the concept of the separation plot. }
\author{
Brian Greenhill <\email{brian.d.greenhill@dartmouth.edu}>}
\note{
This function is still being developed.  Please contact Brian Greenhill with any questions or comments.}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
See \code{\link{sp.categorical}} for plotting separation plots for models with polytomous dependent variables.}

\examples{
\donttest{

# Create a separation plot for a simple logit model:

library(MASS)
set.seed(1)
Sigma <- matrix(c(1,0.78,0.78,1),2,2)
a<-(mvrnorm(n=500, rep(0, 2), Sigma))
a[,2][a[,2]>0.75]<-1
a[,2][a[,2]<=0.75]<-0
a[,1]<-a[,1]-min(a[,1])
a[,1]<-a[,1]/max(a[,1])

cor(a) # should be 0.55

model1<-glm(a[,2]~a[,1], family=binomial(link = "logit"))

library(Hmisc)
somers2(model1$fitted.values, model1$y)

separationplot(pred=model1$fitted.values, actual=model1$y, type="rect",
               line=TRUE, show.expected=TRUE, heading="Example 1")


}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
