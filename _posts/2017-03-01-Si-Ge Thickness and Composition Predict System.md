---
layout: post
title:  "Si-Ge Thickness and Composition Predict System"
date:   2017-10-01
tags: [time1]
---

# Summary
---
Development of an epi-wafer thickness and composition ratio prediction model using Photoluminescence (PL) data. This research aims to build a machine learning model based on measured Photoluminescence phenomenon to minimize performance degradation and achieve cost reduction.

**What is Photoluminescence?** 
Photoluminescence is a phenomenon observed in semiconductor wafers where they absorb light energy when exposed to laser irradiation and subsequently emit light. This principle is utilized in defect inspection by analyzing changes in light emission patterns caused by defects on wafers.

<br>
# Background
---
The objective of this research is to maintain performance compared to a competitor's product (KLA Tencor) while achieving cost reduction. Analysis indicates that the highest cost component in the competitor's product is the nano-scale precision measurement with over 80 measurement sensors. Achieving nano-scale precision requires precision motors and vacuum stages, which are at least eight times more expensive than micro-meter motor-based products. 

<br>
# Solution
---

## PL Data Characteristics
- Epi-wafer thickness and composition are continuous variables.
- Light emission quantities at different depths are measured based on wavelength, resulting in three-dimensional continuous data.

## Methodology
- Development of a machine learning model that predicts the value of a target point using surrounding point data.
- Change the measurement method to perform partial mapping only for points required for prediction, thereby reducing inspection time.

## Feature Selection
- Select the base model and conduct feature selection.
- The objective of feature selection is as follows:

$$Objective_{feature} =  Correlation + \alpha (\text{num_point} \times \text{sensor_price})$$

## Featrue Engineering 
- Since there are no outliers, only scaling is performed.

## Edge Data Processing
- First, the predicted values are obtained using data up to just before the edge. Then, a spline fitting is applied to predict and generate edge data.

## Model Selection
### Experimental results (model and feature-wise performance comparison)
---
<p align="center">
    <img width="600" src="/assets/2017/sige_thickness/All.png" >
</p>

<p align="center">
    <img width="600" src="/assets/2017/sige_thickness/performance_compare.png" >
</p>
 

# Achievements 
---
- Cost efficiency achieved at 32% compared to competitor's product.
- Inspection speed achieved at 3 times faster compared to competitor's product.
- Performance reached 87% of competitor's product.

<br>
# System Architecture
---
<p align="center">
    <img width="600" src="/assets/2017/sige_thickness/IPS_Model1.png" >
</p>


<br>
# Final Result
---
<p align="center">
    <img width="600" src="/assets/2017/sige_thickness/Analysis.png" >
</p>

<p align="center">
    <img width="600" src="/assets/2017/sige_thickness/unisense_main.png" >
</p>






