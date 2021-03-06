source("Libraries/Library.R")
source("Global/Global.R")
source("Functions/Functions.R")


shinyUI(fluidPage(
    navbarPage(
        "FIFA-19 Visualization!",
        tabPanel("Compare Players",
                 fluidRow(
                     column(
                         width = 2,
                         style = "background-color: firebrick; color: white",
                         boxPad(h2("Select Player 1"), align = "center"),
                         pickerInput(inputId = "league1", "League:", choices = sort(unique(md$League))),
                         pickerInput(inputId = "team1", "Team:", choices = ""),
                         pickerInput(inputId = "player1", "Player:", choices = ""),
                         valueBoxOutput("age1", width = 2.4),
                         valueBoxOutput("height1", width = 2.4),
                         valueBoxOutput("weight1", width = 2.4),
                         valueBoxOutput("overall1", width = 2.4),
                         valueBoxOutput("value1", width = 2.4),
                         valueBoxOutput("wage1", width = 2.4),
                         valueBoxOutput("preferredleg1", width = 2.4),
                         valueBoxOutput("position1", width = 2.4),
                         valueBoxOutput("class1", width = 2.4),
                         valueBoxOutput("contract1", width = 2.4),
                         valueBoxOutput("nationality1", width = 2.4)
                         
                     ),
                     column(
                         width = 8,
                         align = "center",
                         
                         tabsetPanel(
                             type = "pills",
                             tabPanel(
                                 "Radar",
                                 plotlyOutput("radarplayers", height = "100%", width = "100%")
                             ),
                             tabPanel(
                                 "Histogram",
                                 fluidRow(column(
                                     width = 12,
                                     plotlyOutput("histogramplayer1", height = "100%", width = "100%")
                                 )),
                                 column(
                                     width = 12,
                                     plotlyOutput("histogramplayer2", height = "100%", width = "100%")
                                 )
                             )
                         ),
                         tags$img(src = "https://upload.wikimedia.org/wikipedia/commons/a/ac/Fifa19.png")
                     ),
                     column(
                         width = 2,
                         style = "background-color: navy; color: white",
                         boxPad(h2("Select Player 2"), align = "center"),
                         pickerInput(inputId = "league2", "League:", choices = sort(unique(md$League))),
                         pickerInput(inputId = "team2", "Team:", choices = ""),
                         pickerInput(inputId = "player2", "Player:", choices = ""),
                         valueBoxOutput("age2", width = 2.4),
                         valueBoxOutput("height2", width = 2.4),
                         valueBoxOutput("weight2", width = 2.4),
                         valueBoxOutput("overall2", width = 2.4),
                         valueBoxOutput("value2", width = 2.4),
                         valueBoxOutput("wage2", width = 2.4),
                         valueBoxOutput("preferredleg2", width = 2.4),
                         valueBoxOutput("position2", width = 2.4),
                         valueBoxOutput("class2", width = 2.4),
                         valueBoxOutput("contract2", width = 2.4),
                         valueBoxOutput("nationality2", width = 2.4)
                         
                         
                     )
                 )),
        tabPanel(
            "League Stats",
            fluidRow(
                column(
                    width = 6,
                    pickerInput("leagues", "Please select the League:", choices = sort(unique(md$League)))
                ),
                tags$style(HTML(".box{text-align:center;}")),
                column(
                    width = 6,
                    box(
                        width = 12,
                        title = tags$b("League Details"),
                        solidHeader = TRUE,
                        fluidRow(
                            valueBoxOutput("values"),
                            valueBoxOutput("numofplayers"),
                            valueBoxOutput("teams")
                        )
                    )
                )
            ),
            tags$br(),
            tags$br(),
            fluidRow(
                column(
                    width = 6,
                    prettyRadioButtons(
                        inputId = "leaguetactic",
                        label = "Best Players in The League in terms of Tactics:",
                        choices = c("4-2-3-1", "3-5-2", "4-3-3"),
                        shape = "curve",
                        status = "success",
                        inline = TRUE
                    ),
                    withSpinner(tableOutput("best_team"))
                ),
                column(
                    width = 6,
                    tabsetPanel(
                        tabPanel("Best Tactics",
                                 tags$br(),
                                 withSpinner(
                                     plotOutput(outputId = "league_besttactic")
                                 )),
                        tabPanel("Nationality",
                                 tags$br(),
                                 withSpinner(plotlyOutput(outputId = "league_nat"))),
                        
                        tabPanel(
                            "Players",
                            tags$br(),
                            prettyRadioButtons(
                                inputId = "leagueclass",
                                label = "Please select the class:",
                                choices = c(sort(unique(md$Class))),
                                shape = "curve",
                                status = "success",
                                inline = TRUE
                            ),
                            tags$br(),
                            withSpinner(plotlyOutput(outputId = "league_players"))
                        ),
                        tabPanel(
                            "Comparison",
                            tags$br(),
                            pickerInput("comp_league", choices = c("League", "Team Total Value", "Position", "Team Overall Based on Class")),
                            br(),
                            withSpinner(plotlyOutput("league_comp"))
                        )
                    )
                )
            )
        ),
        navbarMenu(
            "More",
            tabPanel("Data",
                     tags$br(),
                     pickerInput("Dataset", choices = c("Original", "Modified")),
                     tags$br(),
                     DT::dataTableOutput("table")),
            tabPanel("Report",
                     includeMarkdown("Report/Project_report.Rmd"))
        )
    )
    
    
))

