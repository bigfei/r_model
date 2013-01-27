Week 4 Homework
==============
## 书面作业
### 6.2
研究同一地区土壤所含可给态磷的情况, 得到18组数据如表6.18所示. 表中$X_1$为土壤中所含无机磷, $X_2$为土壤内溶于$K_2CO_3$溶液并受溴化物水解的有机磷,$X_3$为土壤内溶于$K_2CO_3$溶液但不溶于溴化物水解的有机磷,



#### (1)求出$Y$关于$X$的多元线性回归方程.

```r
plot(p)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 

```r
lm.sol <- lm(y ~ x1 + x2 + x3, data = p)
summary(lm.sol)
```

```
## 
## Call:
## lm(formula = y ~ x1 + x2 + x3, data = p)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
##  -27.6  -11.2   -2.8   11.6   48.8 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)   
## (Intercept)   44.929     18.341    2.45   0.0281 * 
## x1             1.803      0.529    3.41   0.0042 **
## x2            -0.134      0.444   -0.30   0.7677   
## x3             0.167      0.114    1.46   0.1657   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## Residual standard error: 19.9 on 14 degrees of freedom
## Multiple R-squared: 0.551,	Adjusted R-squared: 0.455 
## F-statistic: 5.73 on 3 and 14 DF,  p-value: 0.009
```

所以,Y$关于$X$的多元线性回归方程为
$Y=44.929+1.8033X_1+-0.1337X_2+-0.1337X_3$


#### (2)对方差做显著性检验.
回归方程显著，但$X_2$和$X_3$的回归系数不显著。

#### (3)对变量做逐步回归分析.

```r
lm.step <- step(lm.sol)
```

```
## Start:  AIC=111.2
## y ~ x1 + x2 + x3
## 
##        Df Sum of Sq   RSS AIC
## - x2    1        36  5599 109
## <none>               5563 111
## - x3    1       850  6413 112
## - x1    1      4618 10181 120
## 
## Step:  AIC=109.3
## y ~ x1 + x3
## 
##        Df Sum of Sq   RSS AIC
## <none>               5599 109
## - x3    1       833  6433 110
## - x1    1      5169 10769 119
```

```r
summary(lm.step)
```

```
## 
## Call:
## lm(formula = y ~ x1 + x3, data = p)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -29.71 -11.32  -2.95  11.29  48.68 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)   
## (Intercept)   41.479     13.883    2.99   0.0092 **
## x1             1.737      0.467    3.72   0.0020 **
## x3             0.155      0.104    1.49   0.1559   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## Residual standard error: 19.3 on 15 degrees of freedom
## Multiple R-squared: 0.548,	Adjusted R-squared: 0.488 
## F-statistic:  9.1 on 2 and 15 DF,  p-value: 0.00259
```

可见,$x_3$的显著性水平不够理想

```r
drop1(lm.step)
```

```
## Single term deletions
## 
## Model:
## y ~ x1 + x3
##        Df Sum of Sq   RSS AIC
## <none>               5599 109
## x1      1      5169 10769 119
## x3      1       833  6433 110
```

尝试去除$x_3$

```r
lm.sol <- lm(y ~ x1, data = p)
summary(lm.sol)
```

```
## 
## Call:
## lm(formula = y ~ x1, data = p)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -31.49  -8.28  -1.67   5.62  59.34 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   59.259      7.420    7.99  5.7e-07 ***
## x1             1.843      0.479    3.85   0.0014 ** 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
## 
## Residual standard error: 20.1 on 16 degrees of freedom
## Multiple R-squared: 0.481,	Adjusted R-squared: 0.448 
## F-statistic: 14.8 on 1 and 16 DF,  p-value: 0.00142
```

可见,此时的常数项和相关系数皆显著.




