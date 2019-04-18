if (!require('quantmod')){
  install.packages('quantmod')
}

library(quantmod)
library(zoo)
library(xts)
library(TTR)


#查询万科数据-------

res <-getSymbols("WK",auto.assign = F);
res;

#将数据提取到变量中
as.data.frame(res) -> res;

#查看变量

View(res);

#查看最近7天的数据
tail(res,7);
# 
# WK.Open WK.High WK.Low WK.Close WK.Volume WK.Adjusted
# 2019-04-09   50.20  51.565  50.20    51.40    262500       51.40
# 2019-04-10   51.55  52.000  50.83    51.79    224800       51.79
# 2019-04-11   51.87  52.590  51.00    52.55    167900       52.55
# 2019-04-12   52.95  53.000  51.45    51.75    384500       51.75
# 2019-04-15   51.75  52.760  51.53    52.00    120500       52.00
# 2019-04-16   52.20  52.380  51.00    51.38    162200       51.38
# 2019-04-17   51.57  51.800  49.87    50.37    258398       50.37
#将数据写入EXCEL
openxlsx::write.xlsx(res,'wanke1.xlsx');
