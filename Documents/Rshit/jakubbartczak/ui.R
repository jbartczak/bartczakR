shinyUI(fluidPage(
  titlePanel("Pierwsza skromna aplikacja w R"),
  textOutput("currentTime"),
  fluidRow(
    column(3, wellPanel(
      sliderInput("n", "N:", min = 1, max = 20, value = 10,
                  step = 1),
      textInput("text", "Twój tekst:", "Kopiuj ten tekst do okna obok"),
      submitButton("Przycisk")
    )),
    column(6,
      plotOutput("plot1", width = 400, height = 300),
      verbatimTextOutput("text")
    )
  )
))



