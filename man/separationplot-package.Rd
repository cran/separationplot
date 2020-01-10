\name{separationplot-package}
\alias{separationplot-package}
\docType{package}
\title{Separation Plot Package}
\description{Functions to generate separation plots}
\details{
\tabular{ll}{
Package: \tab separationplot\cr
Type: \tab Package\cr
Version: \tab 1,1\cr
Date: \tab 2020-01-07\cr
License: NA\cr
}
Please contact Brian Greenhill <\email{bgreenhill@albany.edu}> with any questions you may have.
}
\author{
Brian D. Greenhill, Michael D. Ward and Audrey Sacks

Maintainer: Brian Greenhill <\email{bgreenhill@albany.edu}>
}
\references{Greenhill, Brian, Michael D. Ward, and Audrey Sacks. "The separation plot: A new visual method for evaluating the fit of binary models." American Journal of Political Science 55.4 (2011): 991-1002.
}
\keyword{ separationplot }

\examples{
\donttest{
# Very simple example from the introduction to the paper:
#
separationplot(pred=c(0.774, 0.364, 0.997, 0.728, 0.961, 0.422), 
actual=c(0,0,1,0,1,1), shuffle=FALSE, line=FALSE, type="rect", rectborder=1)
}
}
