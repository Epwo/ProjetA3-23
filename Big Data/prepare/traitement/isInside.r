isInsideFRsquare <- function(lat, long) {
    squareFR <- matrix(c(39.732580, -10.058320,
            40.295298, 10.602378,
            51.944631, 10.337874,
            50.900084, -7.060609),
            ncol = 2,
            byrow = TRUE)

    x <- squareFR[, 1]
    y <- squareFR[, 2]

  # Check if the point is within the latitude range of the square
  if (lat < min(x) || lat > max(x)) {
    return(FALSE)
  }
  
  # Check if the point is within the longitude range of the square
  if (long < min(y) || long > max(y)) {
    return(FALSE)
  }
  
  # Check if the point is inside the square using the winding number algorithm
  wn <- 0
  for (i in 1:(nrow(squareFR) - 1)) {
    if (y[i] <= long && y[i + 1] > long && ((y[i + 1] - y[i]) * (lat - x[i]) - (lat - x[i + 1]) * (long - y[i])) > 0) {
      wn <- wn + 1
    } else if (y[i] > long && y[i + 1] <= long && ((y[i + 1] - y[i]) * (lat - x[i]) - (lat - x[i + 1]) * (long - y[i])) < 0) {
      wn <- wn - 1
    }
  }
  
  return(wn != 0)
}

CheckInFrance <- function(dataInput) {
    for (i in seq_along(dataInput$ville)) {
            #on vérifie 
        if(!(isInsideFRsquare(dataInput$latitude[i],dataInput$longitude[i]))){
            temp <- dataInput$latitude[i]
            dataInput$latitude[i] <- dataInput$longitude[i]
            dataInput$longitude[i] <- temp
        }

    }
    return(dataInput)
}
    