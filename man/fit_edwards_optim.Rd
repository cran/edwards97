% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fit.R
\name{fit_edwards_optim}
\alias{fit_edwards_optim}
\alias{fit_edwards_coefs}
\alias{coef.edwards_fit_optim}
\alias{coef.edwards_fit_coefs}
\alias{predict.edwards_fit_base}
\alias{coagulate_grid}
\alias{fitted.edwards_fit_base}
\alias{residuals.edwards_fit_base}
\alias{tidy.edwards_fit_base}
\alias{glance.edwards_fit_base}
\alias{print.edwards_fit_base}
\alias{plot.edwards_fit_base}
\title{Fit Empirical Coefficients}
\usage{
fit_edwards_optim(
  data,
  initial_coefs = edwards_coefs("Al"),
  optim_params = list()
)

fit_edwards_coefs(coefs, data = edwards_data("empty"))

\method{coef}{edwards_fit_optim}(object, ...)

\method{coef}{edwards_fit_coefs}(object, ...)

\method{predict}{edwards_fit_base}(object, newdata = NULL, ...)

coagulate_grid(
  object,
  DOC,
  UV254,
  dose = seq(0.01, 2, length.out = 50),
  pH = seq(5, 8, length.out = 50)
)

\method{fitted}{edwards_fit_base}(object, ...)

\method{residuals}{edwards_fit_base}(object, ...)

\method{tidy}{edwards_fit_base}(x, ...)

\method{glance}{edwards_fit_base}(x, ...)

\method{print}{edwards_fit_base}(x, ...)

\method{plot}{edwards_fit_base}(x, ...)
}
\arguments{
\item{data}{A data frame with columns
\code{DOC} (mg/L), \code{dose} (mmol/L), \code{pH} (pH units), \code{UV254} (1/cm), and
\code{DOC_final} (mg/L). See \code{\link[=coagulate]{coagulate()}} for more information.}

\item{optim_params}{Additional arguments to be passed to \code{\link[stats:optim]{stats::optim()}}.}

\item{coefs, initial_coefs}{A set of initial coefficients from which to
start the optimisation. Most usefully one of the coefficient
sets returned by \code{\link[=edwards_coefs]{edwards_coefs()}}.}

\item{object, x}{A fit objected created with \code{\link[=fit_edwards_optim]{fit_edwards_optim()}}.}

\item{...}{Not used.}

\item{newdata}{A data frame with columns
\code{DOC} (mg/L), \code{dose} (mmol/L), \code{pH} (pH units), and \code{UV254} (1/cm). If
omitted, the data used to fit the model is used.}

\item{DOC}{The initial DOC concentration (mg/L).}

\item{UV254}{The absorbance of UV254 (1/cm). With \code{DOC},
used to calculate SUVA.}

\item{dose}{The coagulant metal concentration (Al3+ or Fe3+) in mmol/L.}

\item{pH}{The pH of coagulation.}
}
\value{
An S3 of type "edwards_fit_optim" with components:
\describe{
\item{data, initial_coefs, optim_params}{References to inputs.}
\item{fit_optim}{The fit object returned by \code{\link[stats:optim]{stats::optim()}}.}
}
}
\description{
The coefficients calculated by Edwards (1997) and returned by
\code{\link[=edwards_coefs]{edwards_coefs()}} were designed to produce reasonable results
for several general cases, however each source water will have
a set of empirical coefficients that produce more accurate
predictions than the general case. This function calculates
the optimal coefficients given a test set of known initial
values (DOC)
}
