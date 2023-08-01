---
layout: post
title:  "Non-destructive Inspection of Micro-LED Chip Using Photoluminescence"
date:   2018-03-01
tags: [time1]
---

# 
Overview
---
Non-destructive testing of Micro-LED chips based on laser data using Photoluminescence (PL) phenomena

# Background
---
Typically, for Micro-LEDs, a method called EL (Electroluminescence) is used. EL is a direct current test, which is accurate but has the disadvantage of damaging the chip after the test. Moreover, since it is a sampling test, there are cases where defects are not detected.

This research was conducted to overcome these limitations through non-destructive testing.

- Designed and manufactured an Optical System for Chip Wafer "2, "4 Micro AOI inspections
- Developed an AOI Inspection Algorithm to detect Defect, Chipping based on a minimum Defect Size of 3um x 3um

# Methodology 
---
## 1. Data Optimization Phase 
Used reflection data based on the wavelength, incident angle, and receiver angle of the laser sensor.
The penetration range within the semiconductor chip varies depending on these three factors, and it was necessary to first set the optimal conditions for detecting defects depending on the depth of the chip.


## 2. Predictive Model Development Phase

For defect prediction, the following three models are required.

    1. Object Detection Model
    2. Bounding Box Localization Model
    3. Defect Prediction Model

### 1. Object Detection Model
Implemented the following algorithm for segmentation.

*Region Proposal (Selective Search) -> CNN*

Since it is a super high-resolution image of about 100,000 x 100,000, it was impossible to use real-time operation speed with just CNN. Due to the inspection speed limit, high-speed processing was required. The object detection model was placed in the preliminary step to reduce the operation range of the CNN model.


- **Approach 1**
Tried Faster R-CNN, but objects disappeared during image compression due to the small size of the objects compared to the image size (100,000x100,000).

- **Approach 2**
Used image processing techniques to divide the image so that objects were not cut off, and applied selective search for each image for region proposal purposes. The accuracy was close to 100% in the test results, but the computation speed did not yet meet the standard.

- **Approach 3**
Due to the high standard of required operation speed, traditional image processing techniques were used. The speed met the standard, but the error of object coordinates was high. Therefore, the Bounding Box Localization Model was used in the next process.

- **Lessons Learned**
Learned that traditional image processing methods are much more advantageous than deep learning-based models in terms of operation speed and model control, so they should be appropriately chosen depending on the task.


### 2. Bounding Box Localization Model
The motor moves in Cartesian coordinates (XY), but since the wafer is circular, pixel errors inevitably occur.
Since the data is based on a laser, a coordinate error of the object also occurs due to the output reduction phenomenon at the edge.

Unlike regular photos, the brightness gradient of the entire wafer and the brightness gradient occurring only from the object by the laser are mixed. Therefore, it was not possible to solve it with a conventional solution like OTU binarization or histogram equalization.

To solve this, a reference object's coordinates were created based on the chip in the middle of the wafer. Subsequently, by comparing these coordinates with the coordinates extracted from the actual data, the implementation ensured that the object index (engraved index on each chip) did not change.
<br>


*Object Detection & Bounding Box Localization*
<p align="center">
    <img width="600" src="/assets/2017/microled/chip_seg.png" >
</p>
<br>

### 3. Defect Prediction Model
Upon researching the existing semiconductor chip defect studies, it was found that defects fall into two categories.
```
1. Defects that occurred in one chip
2. Defects that occurred across multiple chips
```
In this project, they were classified into three categories.


*Defect Classification Result*
<p align="center">
    <img width="400" src="/assets/2017/microled/Blue_OverView_Point2Chip.png" >
</p>
<br>
*Process from raw* 
<p align="center">
    <img width="600" src="/assets/2017/microled/DefectMap2.png" >
</p>


# Model Structure
<p align="center">
    <img width="600" src="/assets/2017/microled/structure.png" >
</p>
<br>






