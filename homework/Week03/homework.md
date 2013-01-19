Week 3 Homework
==============
## 书面作业
### 3.1
某单位对100名女生测定血清总蛋白含量(g/L), 数据如下:


#### 计算均值、方差、标准差、极差、标准误、变异系数、偏度、峰度.

```r
data_outline(girls)
```

```
##   均值Mean 方差Var 标准差std_dev 极差R 标准误std_mean 变异系数CV 偏度系数Kurtosis 峰度系数Skewness
## 1    73.67   15.52         3.939    20         0.3959      5.347          0.03702          0.05406
```


### 3.2 
#### 绘出3.1的直方图、密度估计曲线、经验分布图、QQ图,

```r
hist(girls, freq = FALSE, col = "white", border = "red", main = "100名女生测定血清总蛋白含量直方图", xlab = "年龄", 
    ylab = "密度")
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-31.png) 

```r
qqnorm(girls, col = "purple")  #绘制QQ图
qqline(girls, col = "red")  #绘制QQ直线
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-32.png) 

#### 并将密度估计曲线和正态密度曲线比较

```r
plot(density(girls),col="blue", main="100名女生测定血清总蛋白含量密度估计曲线和正态密度曲线")
x<-64:85
lines(x,dnorm(x,mean(girls),sd(girls)),col="green") #正态分布的概率密度曲线
legend(80,0.1, # places a legend at the appropriate place 
       c("密度估计曲线","正态分布的\n概率密度曲线"), # puts text in the legend
       lty=c(1,1), # gives the legend appropriate symbols (lines)
       lwd=c(1,1),col=c("blue","green")) # gives the legend lines        
```

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 

#### 将经验分布曲线与正态分布曲线相比较

```r
plot(ecdf(girls), verticals = TRUE, do.p = TRUE)  #绘制经验分布图
lines(x, pnorm(x, mean(girls), sd(girls)), col = "blue")  #正态经验分布
```

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 

### 3.3
#### 绘出3.1的茎叶图、箱线图,并计算五数总括.
*茎叶图*

```r
stem(girls)
```

```
## 
##   The decimal point is at the |
## 
##   64 | 300
##   66 | 23333
##   68 | 00888777
##   70 | 344444442222
##   72 | 0000000777777555555555555
##   74 | 33333333700000004688888
##   76 | 5555555226
##   78 | 0888555
##   80 | 355266
##   82 | 
##   84 | 3
```

*箱线图*

```r
boxplot(girls)
```

![plot of chunk unnamed-chunk-7](figure/unnamed-chunk-7.png) 

*五数总括*

```r
fivenum(girls)
```

```
## [1] 64.3 71.2 73.5 75.8 84.3
```



### 3.4
分别用W检验方法和Kolmogorov-Smirnov检验方法检验习题3.1的数据是否服从正态分布.

#### W检验方法

```r
result <- shapiro.test(girls)
if (result$p.value >= 0.05) {
    cat("服从正态分布")
}
```

```
## 服从正态分布
```


#### Kolmogorov-Smirnov检验方法

```r
result <- ks.test(girls, "pnorm", mean(girls), sd(girls))  #注意，这里的警告信息，是因为数据中有重复的数值，ks检验要求待检数据时连续的，不允许重复值。
```

```
## Warning: ties should not be present for the Kolmogorov-Smirnov test
```

```r
if (result$p.value >= 0.05) {
    cat("服从正态分布")
}
```

```
## 服从正态分布
```


### 3.9
用Pearson相关校验法检验习题3.7中的身高与体重是否相关.

```
## 
## 	Pearson's product-moment correlation
## 
## data:  体重 and 身高 
## t = 7.555, df = 17, p-value = 7.887e-07
## alternative hypothesis: true correlation is not equal to 0 
## 95 percent confidence interval:
##  0.7044 0.9523 
## sample estimates:
##    cor 
## 0.8778
```

```
## 体重~身高相关
```





