# MustDo
> app description: 꼭 해야할 일을 휴대폰 사용을 강제하여 수행하도록 도와주는 앱

자신이 원하는 목표를 설정할 수 있고, 소요시간을 설정한다. 소요시간을 모두 소모하면 목표가 완료된다.
백그라운드 진입 시, 타이머 노티로 전환되며 완료될 경우 로컬 푸시로 사용자에게 알려준다. (1.0 목표)

조금 재미요소를 추가하자면, 계급같은걸 정해놓고 특정계급에 올라서면 광고가 나와야할 상황에 무시할 수 있는 기회를 제공하고자 한다. 
(계급 예시 - 게으른 범키 → 할건 하는 범키 → 꾸준한 범키 → 성실한 범키)

## 참여자
- Developer
    - [Beomkey](https://github.com/beomkey-nkb)
    - [SeokBA](https://github.com/SeokBA)
- Viewer
    - [felix-mr](https://github.com/felix-mr)

## 프로젝트 목적
원래는 학습이 목적이었으나, 앱을 운영하고 수익을 내는 것을 목적으로 하고 있다.

## architecture
- MVVM + Clean Architecture 기반이지만 살짝 차이가 있다.
- Repository - Usecase - Intercator - View 의 레이어로 구성되어있고, ViewModel은 View를 그리기위한 데이터의 단위이다.
- Repository만 테스트를 위해 protocol로 추상화하여 Usecase를 생성할 때 의존성을 주입하는 방식이다.
- Usecase, Interactor는 code searching의 편의를 위해 추상화하지 않고 실제 객체를 사용한다.

## minimum target
- (X) `13.0`: SwiftUI가 아직 발전 단계이고, 13.0은 SwiftUI가 처음 나왔을 떄의 버전이기 떄문에 버그도 많고 문제가 많다는 의견들이 많았으나 이런 문제점들을 겪으면서 나아가야 성장에 도움이 될 것이라고 판단하여 13.0을 minimum target으로 설정하게 되었다.
- (X) 추후에 버전을 올릴 순 있겠지만, 적어도 첫 배포까진 13.0을 유지할 생각이다.
- (2022.02.04) StateObject 및 async-await를 고려한 아키택처를 설계하기 위해 `15.0`으로 버전을 올림.

## 기능 목록과 이슈 처리
참여자가 전부 개발자다보니.. 따로 관리할 여유는 없을 것이라고 판단한다.
하지만, 팀원도 소수인원이다보니, 소통이 필요하다면 충분히 화상회의를 통해 해결될 것이라고 생각한다.

## 개발 기간
단 기간에 급하게 마무리 지을 생각이 없는 프로젝트이기 때문에 정해진 기간은 없다. 시간이 오래걸리더라도 높은 퀄리티를 만들어내는 것이 목표다.

## ground rule
- 단 시간에 많은 작업을 하는 것은 지양하고, 지속적으로 꾸준히 수행하는 것을 지향한다. 
    - 개발기간에서도 서술 했듯이 모든 것들을 급하게 진행할 생각이 전혀 없다. 하지만, 꾸준하게 활동을 조금씩이더라도 지속했으면 좋겠고 이 프로젝트를 하며 같이 성장했으면 좋겠다. 
- 참여가 힘들다면 언제든 그만둘 수 있고, 다시 재참여도 가능하다.
