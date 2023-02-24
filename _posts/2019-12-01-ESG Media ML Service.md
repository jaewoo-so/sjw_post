---
layout: post
title:  "ESG Media Topic Classification"
date:   2023-01-01
tags: [22year]
---

[KESG Media Portal Site](http://portal.kresg.co.kr/)
[Tutorial : Simple ML Pipeline with Kubernetes + Restful API ]()

## 0. Skill & HW

Service Infra
- Kubernetes : Microk8s ( 1 Master + 2 Worker)
- Github Action 
- MicroService Architecture : Flask + Kubernetes
- Front : Dash for ProtoType
- DataBase : Postgres , mySQL
- GPU : RTX 3090 x 2 

Model 
- python , dash
- pytorch, transformer, tensorflow
- BERT (use embedding layer that fine tuned with KLUE dataset) , LightGBM, Mecab, Konlpy, Scikit-learn, 


## 1. Why Kubernetes? 
- When there were many samples or intermittent network problems, people had to repair them after monitoring each time.
Therefore, self-healing-enabled Kubernetes automates these monitoring and repairs to reduce labor costs.
- Since large-scale traffic could occur in the future, the Load Balance function was required.
- Monitoring functions such as grafana can be set conveniently.
- Despite the resource limitations of single-person development, many useful functions can be easily implemented.

## 2. Why MicroService Architecture?
- Service expansion is planned in the future, and it is configured to reuse existing functions by separating them into functional units.
  
## 3. Why Github Action?
- With Github Action, only docker image and manaifest commit - push on the development server is configured so that the function can be applied directly to the service server.



1. 시스템 요소 
- 데이터 수집 -> ML  Pipeline -> 데이터베이스에 결과 저장 과정 
- 







1. Service Platform 

![](../assets/esg_mdedia/webpage/한국ESG연구소.png)
</br>
![](../assets/esg_mdedia/webpage/한국ESG연구소_이슈종합분석.png)
</br>
![](../assets/esg_mdedia/webpage/한국ESG연구소_기업모니터링.png)
</br>
![](../assets/esg_mdedia/webpage/한국ESG연구소_데이터센터.png)
</br>
![](../assets/esg_mdedia/webpage/한국ESG연구소_기업뉴스조회.png)







