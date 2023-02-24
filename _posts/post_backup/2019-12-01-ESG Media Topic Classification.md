---
layout: post
title:  "ESG Media Topic Classification"
date:   2023-01-01
#tags: [project]
---

[KESG Media Portal Site]()

# Part1 : Optimize topic class structure by ML model 
---
 

1. 목적 
- 기존에는 사람의 기준에서 뉴스 토픽의 기준을 만들었다. 
- 하지만 피쳐 스페이스에서 정확히 분류되기 힘든 클래스들이 관측되었다. 
- 이러한 클래스를 발견하고 클래스 분류 체계의 개선을 제안

2. 베이스 모델 

- 먼저, Multiclass-classification 모델을 만들었다. 
- 베이스모델은 TF-IDF 기반으로 만들었다. : (document frequency ignore 기준 Threshold 0.7 ~ 0.99 를 테스트, 대부분의 주요 단어가 누락되지 않는Threhold를 찾았다.) 


**다음은 베이스 모델의 결과**

class unbalnace 문제가 있었기에, 샘플 수와 정확도는 비례할 것이라고 생각을 하였다. 
하지만 결과는 다음과 같다. 

LightGBM 모델을 사용했고, class weight 사용 전후를 비교한 결과는 아래와 같다. 



베이스 모델의 결과 데이터의 클래스는 4가지로 분류가 된다고 보인다. 

- 샘플 수 많음 , 정확도 높음
- 샘플 수 많음 , 정확도 낮음
- 샘플 수 적음 , 정확도 높음
- 샘플 수 적음 , 정확도 낮음


샘플 수의 많고 적음은 500개를 기준으로 하였다. 
샘플 수 많은데 정확도가 낮은 클래스를 샘플링 조사를 해보았다. 

데이터 자체에 topic이 여러개 인 경우가 많았다. 즉 사람도 정확히 맞추기 힘든 샘플들 이였다. 
이는 모델이나 데이터로 해결할 수 없는 문제이기에 클래스 분류 체계를 변경하는 것을 제안했다. 


아래는 클래스의 분류 체계 변경 후 모델 성능이다. 



뉴스 재분류 작업은 많은 리소스 투입이 필요한 일이기에 현재의 훈련 데이터셋으로 서비스 가능 한 레벨의 

모델의 평가는 f-beta (beta = 0.5)로 설정 했다. 뉴스 데이터 특성상 중복 뉴스가 나오는 경우가 많아 recall 보다는 precision이 더욱 많도록 



# Part1 : Optimize topic class structure by ML model 
---








