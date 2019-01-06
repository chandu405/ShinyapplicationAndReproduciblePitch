#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a wave
shinyUI(pageWithSidebar(
  headerPanel("Water surface for a monochromaic linear wave"),
  sidebarPanel(
    h1("Wave parameters"),
    sliderInput('T', 'Wave Period',value = 10, min = 1, max = 50, step = 0.05),
    sliderInput('h', 'Water depth',value = 10, min = 1, max = 30, step = 0.05),
    sliderInput('A', 'Wave Amplitude',value = 1, min = 0.1, max = 2, step = 0.05)
  ),
  mainPanel(
    tabsetPanel(type="tabs",    
                tabPanel("Plot",br(),
                         h1("Wave plot"),
                         plotOutput('waveplot'),
                         h3("Wave Number"),
                         textOutput("k")),
                tabPanel("Documentation",br(),
                         h4("This is the documentation file for the use of the monochromatic linear wave plot application."),
                         h2("Introduction"),
                         h4("Linear waves are the most simple form of water waves."),
                         h4("A monochormatic wave has a sinusoidal shape, and can characterized by only three basic parameters: amplitude (A), period (T) and depth (h).
                            The three parameters determine the shape of the water surface."),
                         h3("1. Amplitude (A)"),
                         h4("Wave amplitude is the vertical distance from the crest and the trough."),
                         h3("2. Period (T) "),
                         h4("Wave period is the time it takes for a static observer to see two consecutive wave crests (or troughts) 
                            passing by. Equivalently, the period can be substituted by the frequency w (in hertzs, or cycles per
                            second) according to the formula w=2*PI/T"),
                         h3("3. Water depth (h)"),
                         h4("The depth (assumed constant) has an effect on the sinusoidal shape of the wave. This effect is given by a parameter
                            called 'wave number' (K), with k=2*PI/L"),
                         h4("To obtain k (or L) we need to solve an equation called the 
                            'dispersion relationship' (DR hereinafter). The DR is w^2=g*K*tanh(k*h), which relates the frequency w, the wave
                            number k and the water depth h."),
                         h4("Once k is known, we can have the wave surface (eta) as eta =  A * sin(k*x-w*t), where x is the longitudinal
                            coordinate. Everything else is known. In this example t = 0 as the plot is static and we do not intend to show the wave propagating"),
                         h2("How to use the application"),
                         h4("To obtain the wave shape, just use the slide bars to provide the three basic wave parameters to the plot"),
                         h4("Plot limits are set according to usual ranges of the wave parameters"),
                         h4("The plot will reactively change with the input values, and also the wave number k is provided. Note that wave numer is not dependent on the wave amplitude")
                         
                         )
                         )
    )
)
)
