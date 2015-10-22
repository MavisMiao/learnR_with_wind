library(WindR)
library(data.table)
w.start()
w.menu()
w.menu('wsd')
w.menu('wset')

#转换成R语言时间格式
data<-w.wss("600000.SH,000002.SZ","last_trade_day,pre_close")
w.asDateTime(data$Data[,2],asdate=T)

#获取历史序列数据
data<-w.wsd("600000.SH","close,amt","2014-01-30",Sys.Date()-1)
data2<-w.wsd("600000.SH","close,amt","2014-01-30",Sys.Date()-100)

#获取分钟数据
data<-w.wsi("600000.SH","close,amt","2014-06-30 9:00:00")
data2<-w.wsd("600000.SH","close,amt",Sys.Date()-10,Sys.time())

#获取日内tick级别数据
data<-w.wst("601989.SH","open",Sys.time()-2*3600,Sys.time())

#获取历史截面数据
data<-w.wss("600000.SH,600000.SZ","eps_ttm,orps","rptDate=20121231")

# w.wsq 获取和订阅实时行情数据

# w.wset 获取板块、指数等成分数据

# w.weqs 获取条件选股结果

# w.tdays 返回区间内的日期序列
day<-w.tdays("2015-06-01","2015-07-31")

# w.tdaysoffset 基于某个基准时间往前或往后推指定天数的日期

# w.tdayscount 返回某个区间内日期的数量
w.tdayscount("2015-06-01","2015-07-31")

dd<-as.data.table(w_wsd_data$Data)
setkey(dd,DATETIME)
aa<-dd[,(NAV_ADJ-shift(NAV_ADJ))/shift(NAV_ADJ)]
dd[aa]

chongzu$date<-w.asDateTime(chongzu$date,asdate=T)
