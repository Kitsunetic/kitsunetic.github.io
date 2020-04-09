---
title: 'U-net'
date: 2020-04-05
permalink: /posts/2020/04/u-net/
tags:
  - DeepLearning
  - ComputerVision
---

# U-net

https://medium.com/@msmapark2/u-net-%EB%85%BC%EB%AC%B8-%EB%A6%AC%EB%B7%B0-u-net-convolutional-networks-for-biomedical-image-segmentation-456d6901b28a

https://towardsdatascience.com/deep-learning-based-super-resolution-without-using-a-gan-11c9bb5b6cd5

FCN의 단점이었던 출력 영상이 dense하지 못하다는(해상도가 떨어진다는) 단점을 해결하기 위해 고안되었다.

크게 보면 앞부분과 뒷부분의 2 파트로 구성되었는데, 출력 영상의 사이즈를 입력 영상과 동일하게 해주기 위해 앞부분과 뒷부분이 유사한 형태를 띄게 되었고, 결과적으로 U자 모양의 모델이 되어 U-net이라고 불리게 되었다.


