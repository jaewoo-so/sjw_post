---
layout: post
title:  "ESG Media Topic Classification"
date:   2021-04-01
tags: [time2]
---

**Model is applied in below site for classification esg news issue and target company**
- [KESG Media Portal Site](http://portal.kresg.co.kr/)
<br>


# 1. Background and Objective
---
The ultimate goal of the project is to automate the news classification task. The classification system created by humans from a semantic perspective differs from an optimized classification system in terms of the model's feature space perspective. The objective is to narrow this difference and create a class system that is practically usable while optimizing the classification performance.

The task is a multi-label problem related to ESG (Environmental, Social, Governance) issues, aiming to predict whether a news article pertains to ESG evaluation issues for companies and whether it is negative in nature.
<br>


# 2. Sentiment Analysis Model
---    

For the sentiment analysis model, various experiments were conducted using TF-IDF-based features, BERT embedding vectors, and compressed 2000-dimensional features using Auto Encoder, all applied to Tree-based models such as Random Forest and LightGBM. The performance using BERT embedding vectors as features showed better results, thus BERT embedding vectors were selected as the final feature.

<p align="center">
    <img width="800" src="/assets/esg_media/topic/pn_model_confusion.png">
</p>

<p align="center">
    <img width="500" src="/assets/esg_media/topic/pn_auc.png">
</p>

<br>


# 3. Topic Classification Model
---
- Similar to the sentiment analysis model, BERT embedding vectors were found to perform the best for the topic classification model. NN models were built on top of BERT embeddings as the base model. 
- Some classes with a small number of samples (less than 3 occurrences annually) were merged into a single class to address the issue of imbalanced data. 
- The model evaluation used f-beta (beta = 0.5) as the metric, prioritizing precision over recall due to the frequent occurrence of duplicate news in the dataset.
<br>

**Class Distribution**
<p align="center">
    <img width="800" src="/assets/esg_media/topic/class_dist.png">
</p>

<br>

**Model Performance**
<p align="center">
    <img width="800" src="/assets/esg_media/topic/entire_model_performance.png">
</p>
<br>


## Prediction Result Pattern 
<br>
The results from the base model revealed four distinct class patterns:

- High sample count, high accuracy
- High sample count, low accuracy
- Low sample count, high accuracy
- Low sample count, low accuracy

Observations from precision/recall of the base model:

1. There are some major classes with low precision/recall relative to their sample counts, requiring further analysis.
2. Certain minor classes exhibit notably high precision/recall, indicating well-preserved small clusters in the feature space.

<br>
<br>


# 4. Ensemble Model 
---

## 4.1 Class Imablance Measure
To address the multi-majority multi-minority class imbalance issue, imbalance ratio and imbalance degree were examined, and the training dataset was controlled accordingly.

Firstly, since it is a multi-class problem, we measured the imbalance degree instead of the imbalance ratio. To measure the imbalance degree, we assumed the class distribution as the training data's class ratios. Then, we used the Euclidean distance as the distance metric.

By calculating the Euclidean distance between the observed class distribution and the balanced distribution, we can obtain the imbalance degree, which indicates the degree of imbalance in the dataset. Higher values of imbalance degree signify more severe class imbalance in the dataset.

<br>

## Data info
- k = 28 (num of class)    
- total sample size = about 100000

<br>

**Class imbalance degree**


|include 'etc' class | exclude 'etc' class|
|:---:|:---:|
|22.64|18.36|
<br>

The dataset shows significant imbalance, categorized as "multi-minority imbalance" in multi-class classification problems $$\eta_{k}$$ when:

$$\eta_{k} \text{ is multi-minority} \iff \sum^{K} \mathbb{1}\left(\eta_{i} < \frac{1}{K} \right) > \frac{K}{2}$$


## 4.2 Dealing with Imbalance

<br>
To tackle the imbalance issue, Cost-sensitive Learning and Ensemble Methods were employed. Sampling and data augmentation techniques were not used due to several reasons, including the presence of noise and labeling errors in majority classes and the unique nature of ESG-related negative issues, which might introduce bias and errors in generated data.
<br>

## 4.3 Why not use "Sampling" and "Data Augmentation"?  
**Oversampling, Undersampling**
   - There are classes showing severe quality issues like noise or labeling errors in the majority class and well-preserved clusters in the feature space for some minority classes. As a result, achieving equal effects of sampling across all classes is challenging.

**Data Augmentation**
   - Semantic Data Augmentation research on ESG-related content is lacking, and conducting it from scratch would be costly.
   - Using language models like GPT-3 or BERT for data generation could introduce biases or errors due to the uniqueness of negative issues related to ESG, which are based on real-world events. Additionally, the possibility of overfitting is high due to concept shift over time.  
<br>



## 4.2 Ensemble : Model split 

- The approach of training individual models for each label in the multi-label problem was attempted. 
- Although it might be more prone to overfitting compared to training a single model, it offers the advantage of using lightweight models for a subset of labels.


<p align="center">
    <img width="800" src="/assets/esg_media/topic/esg_major_minor_prediction_probability_confusion.png">
</p>

<p align="center">
    <img width="800" src="/assets/esg_media/topic/multiclass_confusion.png">
</p>


<br>
# 5. Final Model Structure
---
<p align="center">
    <img width="1200"  src="/assets/esg_media/topic/topic_classification.png">
</p>

---


# 6. Class Redefinition

The following is the model's prediction result for class "xx contamination."

<p align="center">
    <img width="800"  src="/assets/esg_media/topic/class_combine_air.png">
</p>

 The red bars represent True Positives, while the gray bars represent False Positives, indicating the number of samples predicted as certain classes due to specific class "xx influences". If the False Positives were evenly distributed across different classes, it could indicate a performance issue with the model. However, in the current case, False Positives are concentrated in specific classes. Thus, it could be attributed to a problem with the class classification system rather than the model's performance. As a suggestion, identifying such classes and improving the issue class system in collaboration with the practitioners is recommended.

**Note: Confirmation of the improved classes requires access to KESG Media Portal Site with a paid subscription.**













  