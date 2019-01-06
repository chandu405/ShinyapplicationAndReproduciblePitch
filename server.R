#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
#

library(shiny)
library(UsingR)

# Define server logic required to draw a histogram

shinyServer(
  
  function(input, output) {
    
    k <- reactive({
      
      T<-input$T
      h<-input$h
      
      w<-2*3.14159262/T
      g =9.81
      k0 <-0.025
      
      izq <- w^2/g/k0
      dcha <- tanh(k0*h)
      dif<- izq-dcha
      
      while (abs(dif) > 0.001) {
        if(dif >0.01) {k0<-k0+.001
        } else if(dif < -0.01) {k0<-k0-0.001
        } else { break}
        izq <- w^2/g/k0
        dcha <- tanh(k0*h)
        dif<- izq-dcha
      }
      
      k<-k0 })
    
    output$waveplot <- renderPlot({
      A<-input$A
      h0<-input$h
      T<-input$T
      w<-2*3.14159262/T
      L<-2*3.14159262/k()
      Xmax <-1000
      x<-seq(from=0, to = Xmax, by =L/100)
      eta<-A*cos(k()*x)
      plot(x,eta,ylab="Free Surface (m)", xlab="Direction of wave propagation (m)",col="blue",xlim=c(0,Xmax),ylim=c(-h0,A))
    })
    
    output$k <-renderText({c(k(), "meters")})
    
  }
)
