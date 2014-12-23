#### server script 
library(shiny)
library(SportsAnalytics)
library(ggplot2)

nba11 <- fetch_NBAPlayerStatistics(season = "10-11")
Season <- rep('2010-2011',nrow(nba11))
nba11 <- cbind(nba11,Season)

nba12 <- fetch_NBAPlayerStatistics(season = '11-12')
Season <- rep('2011-2012',nrow(nba12))
nba12 <- cbind(nba12,Season)

nba13 <- fetch_NBAPlayerStatistics(season = '12-13')
Season <- rep('2012-2013',nrow(nba13))
nba13 <- cbind(nba13,Season)

nba14 <- fetch_NBAPlayerStatistics(season = '13-14')
Season <- rep('2013-2014',nrow(nba14))
nba14 <- cbind(nba14,Season)

nba <- rbind(nba11,nba12,nba13,nba14)
ncol(nba)
head(nba)



# server function

shinyServer(function(input, output) {
  
  nba15 <- fetch_NBAPlayerStatistics(season = '14-15')
  Season <- rep('2014-2015',nrow(nba15))
  nba15 <- cbind(nba15,Season)
  nba <- rbind(nba,nba15)  
  
  output$table1 <- renderTable({
    print(nba[which(nba$Name==input$name1),c(2:19,21,25,26)],row.names=F)
  })
  
  output$table2 <- renderTable({
    nba[which(nba$Name==input$name2),c(2:19,21,25,26)]
  })
  
  
  output$table3 <- renderTable({
    print(nba[which(nba$Team==input$team),c(2:19,21,25,26)],row.names=F)
  })                                  
      
  
  output$plot <- renderPlot({
    
    nba$PPG <- nba$TotalPoints / nba$GamesPlayed
    df <- nba[,c('Season','Name','PPG')]
    PPG.1 <- nba[which(nba$Name==input$name1),'PPG']
    PPG.2 <- nba[which(nba$Name==input$name2),'PPG']
    time <- 2010:2014
    df <- as.data.frame(cbind(time,PPG.1,PPG.2))
    
    ggplot(df, aes(x=time)) + 
      geom_point(aes(y = PPG.1)) +
      geom_point(aes(y = PPG.2)) +
      xlab("Season") +
      ylab("Points per Game") +
      geom_line(aes(y = PPG.1, colour= "red")) + 
      geom_line(aes(y = PPG.2, colour= "blue")) +
      theme(legend.position="none",panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
            panel.background = element_blank())
  })

})
  
  
  
  
  
  

  
 