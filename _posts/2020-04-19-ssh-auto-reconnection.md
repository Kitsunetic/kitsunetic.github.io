---
title: '[Common Tips] 자동으로 SSH 재연결하기'
date: 2020-04-19
permalink: /posts/2020/04/ssh-auto-reconnection/
tags:
  - common-tips
---

# SSH Auto Reconnection

네트워크 환경이 좋지 못한 경우 SSH 연결이 자주 끊어지는 문제가 있다.
`tmux`를 사용할 경우 연결이 끊어지더라도 작업이 사라지는 문제는 해결되지만 매번 연결이 끊어질 때마다 비밀번호를 치고 접속해야 하는 번거로움이 남는다.

해당 문제는 shell의 `while`문과 결합해서 쉽게 해결할 수 있다.

```bash
while true; do ssh {USER}@{IP}; sleep 1; done
```

`while true`로 무한 루프를 만들고, `ssh` 명령어로 원격 연결을 수행한다. 연결이 끊어질 경우 `sleep 1` 으로 1초 단위로 계속해서 재연결을 시도한다.

`~/.bashrc` 파일에 해당 명령어를 `alias` 명령어로 등록해 놓으면 편하게 사용할 수 있다.

```bash
echo "alias sshauto="while true; do ssh {USER}@{IP}; sleep 1; done"
```


# SSH Auto Reconnection with `tmux`

`tmux`를 사용하는 환경인 경우 `ssh` 명령어에서 `-t` 옵션을 통해 자동으로 `tmux` session에 연결되도록 만들면 된다.

```bash
while true; do ssh {USER}@{IP} -t tmux a; sleep 1; done
```
