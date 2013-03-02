opar <- par(no.readonly=TRUE)
# 读数据文件
a <- read.table(file("wiki.dat"), header = TRUE, sep=":")

men <- levels(a$name) # 版本发布人
total <- max(a$wc) # 最大版本内容

# 画布要素全局设置
par(lwd=5,bg="#3D3D3DBB")
col1 <- c("#5FD213FF","#FD5800FF","#129DF0FF")
cst <- 20 # 设定版本颜色渐变的步长
palette(col1)

debug0 <- T # 控制是否输出关联区域绘图
# 根据版本内容设定坐标系的大小
h <- max(total + 1)
w <- max(a$no.)
h

plot(0,0, type="n", col=1, xlim=c(-0.5, w+0.3),  ylim=c(0,h+1))

# 对第一次版本处理
a2 <- strsplit(as.character(a$cont[1]),";")
x <- c(1,1)
y <- c(h, h - as.numeric(a2[[1]][2]))
lines(x,y, col= which(men == a2[[1]][1]))
text(1, h+1 ,paste("version",1),col="white")

# 开始绘图
for(i in 2:w){
  # 分解数据：其中a21表示版本人，a22表示版本内容大小，a23表示版本的历史修改步长
  # 技巧：a23中（0，1）2个数字在程序中做了特殊处理 0 表示删除，1 表示新增
  
  a2 <- strsplit(as.character(a$cont[i]),";")
  a21 <- strsplit(a2[[1]][1],",")[[1]]
  a22 <- as.numeric(strsplit(a2[[1]][2],",")[[1]])
  a23 <- as.integer(strsplit(a2[[1]][3],",")[[1]])
  
  hy1 <- 0
  hy2 <- h
  py1 <- 0
  py2 <- h
  text(i, h+1 ,paste("version",i),col="white")
  j <- 1
  while(j <= length(a21)){
    if(a23[j] == 0){
      py2 <- py2 - a22[j]
    }else{
      x <- c(i,i)
      y <- c(hy2, hy1 <- hy2 - a22[j]) 
      lines(x,y, col= which(men == a21[j]))
      py1 <- py2 - a22[j]
      
      if(a23[j] > 1 && debug0){
        xx <- c(i,i,i-1,i-1,i)
        yy <- c(hy2 ,hy1 ,py1 ,py2 ,hy2)
        col2 <- col1[which(men == a21[j])]
        col3 <- as.integer(paste('0x',substr(col2, 8,9),sep='')) - cst*i
        col2 <- paste(substr(col2, 1,7),toupper(as.hexmode(col3)),sep="")
        
        polygon(xx, yy, col=col2, border=NA)
        py2 <- py1
      }
      hy2 <- hy1
      
    }
    
    j <- j + 1
  }
  
}
# 输出版本发布人姓名
x <- -0.5
y <- 5
h <- 1.5
for(m in men){
  text(x,y,m,col=grep(m, men),adj = c(0, NA))
  y <- y - h
}
par(opar)