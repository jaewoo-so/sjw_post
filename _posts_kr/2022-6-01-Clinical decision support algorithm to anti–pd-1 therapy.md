---
layout: post
title:  "Clinical decision support algorithm based on machine learning to assess the clinical response to anti–pd-1 therapy"
tags: [publication_patents]
---


## A tissue origin prediction device, method of predicting the tissue origin using a genome data, and computer program
### 1020200076756 · Filed Jun 23, 2020

summary 

 Anti-programmed death (PD)-1 therapy (αPD-1) has been used in patients with non-small cell
lung cancer (NSCLC), leading to improved outcomes. However, the outcomes of therapy are still
insufficient, and the expression of PD-ligand 1 (PD-L1) is not always a predictor of response to
αPD-1. 

 NSCLC의 치료 목적으로 사용되는 면역 항암제는 일반적으로 키트루다와 옵티보이다.
한 달 치료비는 각각 약 60만 달러와 80만 달러이며, 연간 거의 천만 달러의 비용이 든다.
 The immuno-cancer drugs used for treatment purposes of NSCLC are typically Kitruda and Optivo.
Each monthly treatment costs about $600,000 and $800,000, respectively, and costs nearly $10 million a year.


하지만 모든 환자에게 약물이 반응하지 않는다. 따라서 키트루다의 경우 PD-L1 발현 양성 비율'이 50% 이상이어야 처방을 받을 수 있다.하지만 조건이 만족되어 처방을 받아도 실제 약물반응은 약 60% 대 이다. 
But the drug doesn't respond to all patients. Therefore, in the case of Kitruda, the 'PD-L1 expression positive rate' must be 50% or more to be prescribed. However, even if the conditions are satisfied and prescribed, the actual drug reaction is about 60%.

우리는 다른 환자의 정보를 사용하여 약물 예측 모델을 연구하여 좀더 많은 환자들이 올바른 처방을 받고 약물 낭비에 의한 비용을 줄이려 한다. 


---

## 사용된 데이터 
- clinical data including patient characteristics, 
- mutations
- laboratory findings from the electronic medical records

## 데이터 특징 
- missing value가 대부분의 피쳐에 존재. 단순 mean, zero 등의 방법이 아닌, 다른 피쳐 및 해당 피쳐의 non-missing value의 분포를 기준으로 inputation 모델을 별로도 학습. 
- leakage로 의심되는 피쳐 제거 
- 

## 모델 선택 및 검증
- 모델의 적절한 복잡성을 찾기 위해 리니어 모델도 포함하여 모델 선택 진행. 
- 샘플 수가 적어서 모델 선택에는 LOOCV 사용
- 분야 특성상 어느정도의 설명력이 필요하여, 성능 극대화를 위한 앙상블 단계를 진행하지 않음. 
- LOOCV 결과로 어느정도 아웃라이어로 보이는 샘플들을 발견. (3개의 샘플)

## 모델 기반 피쳐 분석
- 데이터간의 interaction 효과가 있을 가능성이 매우 높다. 
- 따라서 단순 entropy기반의 피쳐 중요도는 해석에 오류가 생길 가능성이 높음.   
- Lime 기반의 explanation model은 샘플수가 적어서, local model 피팅에 문제가 생길 여지가 많다고 판단.  
- 각 샘플 대상으로 shap value의 평균 및 interaction value를 계산했다. 





![main_fig](/assets/publication_patents/CDSS_main.jpg)



![front](/assets/publication_patents/paper_front.png)

실제 임상 데이터를 사용. 여기에는 ~~ 등과같은 클리니털 데이터,  ~~ 유전체 데이터, ~~ 의료이미지 데이터 등등이 포함되었다. 

우리의 목표는 최소한의 비용으로 PD-L1 기반의 약물 예측보다 정확도가 높은 약물반응 모델을 만드는 것이다. 따라서 정확도를 최대화 한면서  피쳐 생산 비용을 최소화 해야 했다. 
 상관관계를 조사 해서 피쳐 탈락시킴



![tumor](/assets/publication_patents/paper_tumor.png)



![score](/assets/publication_patents/paper_score.png)


마지막 

![shap](/assets/publication_patents/paper_shap_val.png)

The persence of non-measurable lesions 의 경우 오디너리 형식의 데이터이므로, spearman correlation을 살펴본다. 
correlation = -0.44 , p-value = 8.1e-11 이 나왔다. 
즉, 

<!-- 반응 여부 : 바이너리, lesions은 오디너리 형식(0,0.5,1)  
correlation을 스피어만 , 피어슨중 골라야함. 
설명을 하면 
스피어만은 monotonic relationship, 피어슨은 linear relationship 이 있는지를 보는 것이다. 
모노토닉은 한 변수가 증가할때 다른 변수도 증가하는지 여부만 보는것. 
linear는 한변수가 1증가시 다른변수도 같은양인 1로 증가하는지, 증가 폭도 같이 보는것이다. (양적관계도 포함되어있다.)
 -->


링크 


- 그림
- 그림
- 그림
- 그림



