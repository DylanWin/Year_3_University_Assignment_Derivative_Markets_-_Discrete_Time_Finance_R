# F79DF Assignment 2

# m being contract multiple
m<-100
newbeta<-1.5
index<-read.csv('Index.csv')
port<-read.csv('Portfolio.csv')
# Extract total row number for portfolio data and index data
index_row_index<-which(index['Date']==toString(tail(index$Date, 1)))
port_row_index<-which(port['Date']==toString(tail(port$Date, 1)))

# Create empty array
ret_port<-array()
ret_market<-array()

# if particular row date from portfolio and index data compared to pevious date is less than or equal 2 
# Add returns of portfolio and market(index) to array
for (i in 2:index_row_index){
  if(as.numeric(difftime(port$Date[i],port$Date[i-1],units = "days"))<=3 & as.numeric(difftime(index$Date[i],index$Date[i-1],units = "days"))<=3){
      ret_port[i-1]<-((port[i,3]-port[i-1,3])/port[i-1,3])
      ret_market[i-1]<-((index[i,3]-index[i-1,3])/index[i-1,3])
  }
}

# Remove NA value created by empty array
ret_port<-ret_port[!is.na(ret_port)]
ret_market<-ret_market[!is.na(ret_market)]

# Last day value of portfolio and index data
port_today<-tail(port$Close, 1)
index_today<-tail(index$Close, 1)

portfoliobeta<-cov(ret_port, ret_market, use='complete.obs')/var(ret_market, na.rm=TRUE)
portfoliobeta
result<-(newbeta-portfoliobeta)*(port_today)/(index_today*m)
result
paste('portfoliobeta is ', portfoliobeta)
paste('result is ', result)
