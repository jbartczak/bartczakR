shinyServer(function(input, output, session) {
  output$plot1 <- renderPlot({
    hist(rnorm(input$n))
  })

  output$text <- renderText({
   	
	    paste0('Mój tekst wpisany obok: ', input$text,'.\nWybrana wartość na pasku: ', input$n)
	
  })
  
  output$currentTime <- renderText({
    invalidateLater(1000, session)
    paste("Aktualny czas", Sys.time())
  })
  
  
    logfilename <- paste0('logfile',
                        floor(runif(1, 1e+05, 1e+06 - 1)),
                        '.txt')



  obs <- observe({    
    cat(input$n, '\n', file = logfilename, append = TRUE)
  })


  session$onSessionEnded(function() {
    obs$suspend()

    unlink(logfilename)
  })

 
  
})


