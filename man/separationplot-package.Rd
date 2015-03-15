\name{separationplot-package}
\alias{separationplot-package}
\docType{package}
\title{Separation Plot Package}
\description{Functions to generate separation plots}
\details{
\tabular{ll}{
Package: \tab separationplot\cr
Type: \tab Package\cr
Version: \tab 1,0\cr
Date: \tab 2011-06-13\cr
License: NA\cr
}
This package is still in development.  Please contact Brian Greenhill <\email{brian.d.greenhill@dartmouth.edu}> with any questions you may have.
}
\author{
Brian D. Greenhill, Michael D. Ward and Audrey Sacks

Maintainer: Brian Greenhill <\email{brian.d.greenhill@dartmouth.edu}>
}
\references{
Contact Brian Greenhill <\email{brian.d.greenhill@dartmouth.edu}> for a copy of the paper that explains the concept of the separation plot. }
\keyword{ separationplot }

\examples{
\donttest{
# Very simple example from the introduction to the paper:
#
separationplot(pred=c(0.774, 0.364, 0.997, 0.728, 0.961, 0.422),
               actual=c(0,0,1,0,1,1), shuffle=FALSE, line=FALSE,
               type="rect", rectborder=1)
}
}
