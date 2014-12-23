shinyUI(navbarPage("NBA Data",
                   
                   
                   tabPanel("Box Score",
                            
                     fluidRow(
                     
                     column(12,
                            wellPanel(
                              textInput("name1", label = h5("Name of Player A:"), 
                                        value = "Lebron James")
                            )       
                     )),
                     
                     fluidRow(tableOutput('table1')),
                     
                     
                     hr(),
                     br(),
                     
                     fluidRow(
                       
                       column(12,
                              wellPanel(
                                textInput("name2", label = h5("Name of Player B:"), 
                                          value = "Kobe Bryant")
                              )       
                       )),
                     
                     fluidRow(tableOutput('table2'))
                     
                     ),
                     
                   tabPanel("Trend",
                      fluidRow(
                        column(12,
                               wellPanel(
                                 selectInput('measure',label=h5('Select a Measurement'),choices=c('Points per Game'),selected='Points per Game')
                                 ))),
                      fluidRow(plotOutput('plot'))
                            
                            
                            ),
                   
                   
                   tabPanel("Team Stat",
                            
                     fluidRow(
                       
                     column(12,
                            wellPanel(
                              selectInput("team",label=h5("Select a Team:"),choices=c('GSW','DEN','MIN','TOR','OKL','POR','ORL','BOS','MEM','LAC','NOR','SAN','NYK','MIA','ATL','LAL','CHI','DAL','PHI','UTA','WAS','MIL','PHO','HOU','DET','SAC','IND','CLE','NJN','OKC','BRO'),selected="CLE"))   
                       
                       )),
                     
                     fluidRow(tableOutput('table3')))
))