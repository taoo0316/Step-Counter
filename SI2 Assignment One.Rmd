---
title: "Assignment 1"
author: "Zhu Wentao"
date: "9/6/2021"
output: pdf_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:




```{r}
drunk_moving <- function(p){
  if (runif(1) <p) {
    return (1)
  } else {
    return (-1)
  }
}
drunk_moving(0.000001)
escape_steps <- 1000
counter <- 1
count_step <- function(p,L) {
 while(counter < escape_steps && L>0) {
   L <- L + drunk_moving(p)
   counter <- counter+1
 }
  return(counter)
}
count_step(0.3,5)
fall <- function(p,L) {
  if (count_step(p,L) == escape_steps) {
    return (FALSE)}
  else{
    return(TRUE)}
}
fall(0.4,5)

repetitions <- 1000
result <- vector(length = repetitions)
fall_probability <- function(p,L) {
  for (ii in 1:repetitions) {
    result [ii]<- fall(p,L)
  }
  return(sum(result)/repetitions)
}
fall_probability(0.6,10)
```
```{r}
my_list <- c(0.6,0.7,0.8,0.9)
curve((1-x)/x, from=0.5, to=1, , xlab="x", ylab="y")
points(0.6,fall_probability(0.6,1))
points(0.7,fall_probability(0.7,1))
points(0.8,fall_probability(0.8,1))
points(0.9,fall_probability(0.9,1))
#The result makes sense as the values obtained by our model are 
#rather close to the ones calculated from the formula.
#It indicates that the model we obtained is an accurate one. 

```

