---
layout: post
title:  "Si-Ge Thickness and Composition Predict System[KR]"
date:   2017-03-01
tags: [year22]
---


# 개요
Photoluminescence(PL) 현상을 이용한 웨이퍼 두께 및 조성비 알고리즘 연구개발. 
에피 웨이퍼의 품질 평가를 위해서 웨이퍼의 두께 및 조성비를 측정하게 됩니다. 
본 연구에서는 Photoluminescence 현상을 측정된 데이터를 기반으로 머신러닝 모델을 구축하여 성능 저하를 최소화 하고 원가절감을 실현했습니다. 

Photoluminescence 현상이란? 
반도체 웨이퍼에 레이저를 조사시 빛 에너지를 받아들이고 다시 빛을 방출하는 현상입니다. 
이때 웨이퍼에 디펙트가 존재시, 빛을 방출하는 패턴이 달라지는 원리를 이용해서 디펙트 검사에 사용합니다. 

# 배경 및 목적
본 연구의 목적은 경쟁사(KLA Tencor) 제품대비 성능은 유지, 원가는 절감을 목적으로 합니다. 
경쟁사 제품에서 원가비중이 가장 높을 것으로 분석된 부분은 나노미터단위의 초정밀측정, 80여개의 측정 센서입니다. 
특히 나노미터 단위를 위해서는 초정밀모터와 진공스테이지가 필수적이고, 이는 마이크로 미터 모터 기반의 제품보다 원가가 최소 8배 이상 비싸지게 되는 원인이 됩니다.  

# 솔루션
에피웨이퍼의 두께 및 조성은 연속형입니다. 
이러한 특징을 이용해 주변 포인트 데이터를 사용해서 대상 포인트의 값을 예측하는 머신러닝 모델을 개발했습니다. 
즉, 전체 맵핑에서 예측에 필요한 포인트만 부분맵핑하는 측정방식으로 변경하였습니다. 

# 역활 및 연구 내용 
- 샘플의 최적 피쳐를 먼저 선택해야 했다. PL기반 데이터는 빛 에너지의 출력,파장,입사각,수신부의 각도에 따라 도달 깊이 및 결과의 특성이 달라집니다. 따라서 


# 효과 
- 마이크로미터 모터 사용, 진공스테이지 미사용, 센서 80개 -> 15개
- 최종 원가 비용 1/3 수준으로 감소. 

# 결과물 소개  

<p align="center">
    <img width="600" src="/assets/2017/sige_thickness/All.png" >
</p>

<p align="center">
    <img width="600" src="/assets/2017/sige_thickness/Analysis.png" >
</p>

<p align="center">
    <img width="600" src="/assets/2017/sige_thickness/unisense_main.png" >
</p>

<p align="center">
    <img width="600" src="/assets/2017/sige_thickness/IPS_Model1.png" >
</p>

<p align="center">
    <img width="600" src="/assets/2017/sige_thickness/IPS_Model2.png" >
</p>

<p align="center">
    <img width="600" src="/assets/2017/sige_thickness/performance_compare.png" >
</p>

![image](/assets/2017/sige_thickness/performance_compare.png)

# 데이터


# 측정 방법


# 방법 

나노 단위의 움직임을 위해서는 진공스테이지와 고정밀모터가 필요. 



# 디스커션 





