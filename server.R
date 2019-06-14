#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#m00


library(shiny)
library(shinydashboard)
library(readxl)
library(openxlsx);
library(stringr);
# library(ptcal)
# library(tsdap)


 shinyServer(function(input, output) {
  
     #读取Excel全部上传数据------
   csvdata <- reactive({
     res <-getSymbols(input$sotckNo,auto.assign = F);
     #将数据提取到变量中
     as.data.frame(res) -> res;
     res$fdate <- rownames(res);
     res <-res[order(res$fdate,decreasing = T),];
     res;
     
   })

   observeEvent(input$getStock,{
     output$content_table <- renderDataTable({
       data <- csvdata()
       #names(data) <-templateNameCn; 
       head(data);
     },options = list(orderClasses = TRUE,
                      lengthMenu = c(6,10,50,100), 
                      pageLength = 6))
     
   })
    
  #将上传的数据显示在表格中 -----

  #处理后的所有数据------
  
  

  # 处理新个税计算结果的处理逻辑-------
  output$report_xlsx<- downloadHandler(
    filename = paste(input$sotckNo,'股票数据_截止',Sys.Date()-1,'.xlsx',sep=""),
    content = function(file) {
      openxlsx::write.xlsx(csvdata(), file, sheetName = 'sheet1');
    }
  )
   
 }
)
