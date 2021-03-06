---
title: "Homework"
date: 2017-10-17T15:26:15Z
lastmod: 2018-12-08T15:26:15Z
publishdate: 2018-11-23T15:26:15Z
draft: false
weight: 1
---


## Homework 1 - DAACS

**Due January 27th**

Go to [demo.daacs.net](https://demo.daacs.net), create an account, and complete the self-regulated learning and mathematics assessments. When done, enter your name and email address used to create an account on the DAACS website below. This is an ungraded assignment (i.e. you get credit for completing the assessments, not for the results). [Click here to submit](https://forms.gle/ts3GFQbFYJny1Lbp8)

## Homework 2 - Inference for Numerical Data

**Due February 17th**

[Click here](https://github.com/jbryer/EPSY630Spring2020/blob/master/Homework/Homework7.pdf) to download a PDF of the assignment and [here for an Rmarkdown template](https://raw.githubusercontent.com/jbryer/EPSY630Spring2020/master/Homework/Homework7.Rmd) (right click and choose save link as).


## Homework 3 - Linear Regression

**Tentatively due February 24th**

[Click here](https://github.com/jbryer/EPSY630Spring2020/blob/master/Homework/Homework8.pdf) to download a PDF of the assignment and [here for an Rmarkdown template](https://raw.githubusercontent.com/jbryer/EPSY630Spring2020/master/Homework/Homework8.Rmd) (right click and choose save link as).

## Homework 4 - ANOVA

**Due March 30th**

From the OpenIntro textbook, chapter 7 (starting page 295): 7.38, 7.40, 7.42

For question 7.42, you can download the date file [here](https://github.com/jbryer/EPSY630Spring2020/blob/master/course_data/gss2010.Rda?raw=true). The following R code will subset the full data frame to include the two variables necessary and recode the degree level variable.

```
load('gss2010.Rda')
gss <- gss2010[, c('degree', 'hrs1')]
levels(gss) <- c("Less than HS","HS", "Jr Coll", "Bachelor's", "Graduate")
```

