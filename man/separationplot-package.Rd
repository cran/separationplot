\name{separationplot-package}
\alias{separationplot-package}
\docType{package}
\title{
\packageTitle{separationplot}
}
\description{
\packageDescription{separationplot}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{separationplot}
\packageIndices{separationplot}
A package to create "separation plots" as described in Greenhill, Ward, and Sacks (2011).
}

\author{
\packageAuthor{separationplot}

Maintainer: \packageMaintainer{separationplot}
}
\references{Greenhill, Brian, Michael D. Ward, and Audrey Sacks. "The separation plot: A new visual method for evaluating the fit of binary models." American Journal of Political Science 55.4 (2011): 991-1002.
}
\keyword{ separationplot }

\examples{
# Very simple example from the introduction to the paper:
separationplot(pred=c(0.774, 0.364, 0.997, 0.728, 0.961, 0.422), 
actual=c(0,0,1,0,1,1), shuffle=FALSE, 
line=FALSE, type="rect", rectborder=1)
}
