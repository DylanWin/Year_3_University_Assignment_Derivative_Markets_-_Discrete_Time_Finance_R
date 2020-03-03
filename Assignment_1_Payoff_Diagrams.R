# F79DF Derivative Markets and Discrete Time Finance

# From variable y (line 5):
# ST is payoff for plot(a), -50+ST for plot(b), rep(-25, 51) for plot(c), -25+ST for plot(d), 25-ST for plot(e), (-25+ST)+(20-ST) for plot(f)
ST=seq(0,50,1); y=c(ST, 'a', -50+ST, 'b', rep(-25, 51), 'c', -25+ST, 'd', 25-ST, 'e', (-25+ST)+(20-ST), 'f')

# Store data in a list of arrays , data
data=as.list(vector("list",5)); label=c(y[52], y[104], y[156], y[208], y[260], y[312]); color=c('blue', 'red', 'red', rep('green',2), 'red')
data[[1]]=y[1:51]; data[[2]]=y[53:103]; data[[3]]=y[105:155]; data[[4]]=y[157:207]; data[[5]]=y[209:259]; data[[6]]=y[261:311]; data

# Plot and save file in pdf format of current working directory
path=paste(getwd(), '/E_F79DF_1_H00280633.pdf'); 
path=gsub(' ', '', path);  
pdf(file=path,  width=8, height=8)
par(mfrow=c(3,2), oma = c(0, 0, 2, 0));

for(i in 1:6){ 
  plot(ST, data[[i]],  xlab='Price at T', ylab='Payoff', main=paste('Plot (',label[i], ')'), type='l', col=color[i]) 
  }
mtext('F79DF Assignment 1, outer = TRUE, cex = 1.3); 
dev.off()
