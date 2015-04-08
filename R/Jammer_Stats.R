#' Jammer Stats
#'
#' This function takes a data frame of jammer stats and calculates LJ Percentage and Total Points for each jammer
#' @param data frame of jammer stats
#' @keywords roller_derby jammer_stats
#' @export
#' @examples
#' jammer_stats(data)

jammer_stats <- function(data) {
  # itialize and format dataframe
  data<-data
  colnames(data) <- c("Jam","Jammer","Team","Lead","Points")
  jammers<-as.character(unique(data$Jammer))
  jammer_stats <- data.frame( "Jammer" = character(length(jammers)), "Team" = character(length(jammers)), "LJ_Percentage" = numeric(length(jammers)), "Total_Points" = integer(length(jammers)), stringsAsFactors=FALSE)
  # loop through jammers
  for (i in 1:length(jammers)) {
    jammer_data <- data[which(data$Jammer == jammers[i]),]
    jammer_stats$Jammer[i] <- jammers[i]
    jammer_stats$Team[i] <- as.character(jammer_data$Team[1])
    jammer_stats$LJ_Percentage[i] <- LJ(jammer_data$Lead)
    jammer_stats$Total_Points[i] <- total_points(jammer_data$Points)
  }
  return(jammer_stats[ order(-jammer_stats$Total_Points),])
}

total_points <-function(list){
  S <- sum(list)
  return(S)
}


LJ <-function(list){
  N <- length(list)
  S <- sum(list)
  P <- S/N 
  return(P)
}

