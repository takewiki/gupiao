#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
# m00

library(shiny)
library(shinydashboard)
# library(ptcal)
# library(tsdap)
#library(tsda);
#library(recharts)
# 1.01 add the 1st msg notification Menu----






shinyUI(dashboardPage(skin = "blue",
                    
                    # add the themes selector
                    
                    #ui.header ----
                    
                    dashboardHeader(title = "股票数据获取"
                                                        
                    ),
                    
                    #ui.sideBar----
                    dashboardSidebar(
                        sidebarMenu(
                        # add the item
                       
                        menuItem(text = "工作区",tabName = "rdCostingTopic")
                        
                        
                      )
                    ),
                    
                    #ui.body----
                    dashboardBody(
                      tabItems(
                        # First tab content
                        
                        tabItem(tabName = "rdCostingTopic",
                                tabsetPanel(
                                  
                                  tabPanel("主界面", 
                                           fluidRow(
                                             box(title = "选择数据源",width = 3, status = "primary",
                                                # delete the option 删除这个选项，因为我们根本不提供CSV的选择
                                                # radioButtons("fileType","文件类型",choices = c("Excel","CSV"),selected = "Excel"),
                                                textInput('sotckNo','请输入股票代码(默认为万科代码):',value = 'WK'),
                                                actionButton('getStock',label = '获取股票数据'),
                                                downloadButton("report_xlsx", "下载xlsx格式数据")),
                                               
                                             box(title = "预览股票数据:",width = 9, status = "primary",
                                                 HTML('友情提示:仅显示前6行记录，用于标题及内容确认。'),
                                                 dataTableOutput("content_table"))
                                             
                                             
                                                                                        )
                                          
                                           
                                  )
                                  
                                  
                                  
                             
                                )
                                )  
                      )
                    )
)
)


