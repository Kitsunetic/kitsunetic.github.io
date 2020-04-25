---
title: 'PyTorch 모델이 현재 CPU인지 GPU인지 확인하는 방법'
date: 2020-04-25
permalink: /posts/2020/04/check-pytorch-module-on-cuda/
tags:
  - common-tips
---

# PyTorch 모델이 현재 CPU인지 GPU인지 확인하는 방법

## 여담

CPU와 GPU를 동시에 지원하도록 프로그램을 짜다 보면 종종 모델이 현재 CPU에서 작동 중인지 GPU에서 작동 중인지 확인해볼 필요가 발생한다.
하지만 `torch.nn.Module` 객체에는 해당 모듈이 GPU에 업로드 되어있는지를 확인하는 기능이 없다.

왜인가 하면 아마도 모듈은 여러 종류의 다른 모듈과 텐서를 내부에 포함할 수 있고, 경우에 따라서는 모듈 내부의 일부 모듈이나 텐서만 GPU에 업로드하고 나머지는 CPU에서 작동하도록 하는 등 입체적인 구조를 갖는 경우도 존재한다.
그러므로 모듈 객체 자체가 자기 내부의 모든 모듈과 텐서의 상태를 대표하기에는 무리가 있기 때문에 모듈 자체에 `device`의 상태를 확인하는 기능이 없는게 아닐까 하고 생각된다.

---

## 소스코드

https://discuss.pytorch.org/t/how-to-check-if-model-is-on-cuda/180/2

위의 페이지를 참고하면 기본적으로

```python
print(next(net.parameters()).is_cuda)

# 실행 결과
# True or False
```

를 통해 모듈이 GPU에 업로드 되어있는지를 확인할 수 있다고 한다.
모듈의 내부 텐서에는 `device`의 상태를 확인하는 기능이 있기 때문에 가능하다.

만약 여러개의 GPU를 활용 중이고, 몇 번째 GPU를 사용 중인지 확인하고 싶다면 아래와 같은 코드로 확인할 수 있다.

```python
# Check CPU
model = nn.Conv2d(3, 3, 3)
print(next(model.parameters()).device)
# result: device(type='cpu')

# Check GPU
model = model.cuda()
print(next(model.parameters()).device)
# result: device(type='cuda', index=0)

# Check multi GPUs
device = torch.device('cuda:2')
model = model.to(device)
print(next(model.parameters()).device)
# result: device(type='cuda', index=2)
```
