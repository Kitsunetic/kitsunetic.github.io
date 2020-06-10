---
title: '[Common Tips] pip install에 mirror 적용하기'
date: 2020-04-19
permalink: /posts/2020/04/pip-mirror/
tags:
  - common-tips
---

`~/.pip/pip.conf` 파일에 mirror 사이트의 주소를 입력해주면 된다. Windows OS라면 `%APPDATA%/.pip/pip.conf`에저장해주어야 한다.

`.pip` 폴더와 `pip.conf` 파일은 기본으로 생성되지 않으므로 만약 없다면 직접 만들어줘야 한다.

`pip.conf` 파일에 아래의 내용을 입력해준다. 아래 예제에서 사용한 mirror 사이트는 Kakao에서 서비스해주고 있는 [mirror.kakao.com](http://mirror.kakao.com/)를 사용했다. (2020년 4월 시점에서 https는 지원하지 않는다.)

```conf
[global]
index-url=http://mirror.kakao.com/pypi/simple
trusted-host=mirror.kakao.com
```
