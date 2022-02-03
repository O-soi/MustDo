# MustDo
> app description: 꼭 해야할 일을 휴대폰 사용을 강제하여 수행하도록 도와주는 앱

## 참여자
- Developer
    - [Beomkey](https://github.com/beomkey-nkb)
    - [felix-mr](https://github.com/felix-mr)
- Reviewer
    - [SeokBA](https://github.com/SeokBA)

## 프로젝트 목적
Clean SwiftUI architecture 학습이 주된 목적이고, SwiftUI에 익숙해지기 위함이다. 더 나아가 더 좋은 설계 방식을 모색해볼 수 있다.

## architecture
- [Clean SwiftUI](https://nalexn.github.io/clean-architecture-swiftui/)를 기반으로 한다. 프로젝트 생성은 UIKit으로 생성 후, SwiftUI로 진행
- [Clean SwiftUI Sample Project](https://github.com/nalexn/clean-architecture-swiftui)
- [Clean SwiftUI Sample Project 분석 Notion](https://lucky-sleet-a6d.notion.site/Clean-SwiftUI-Project-d7740078874c43d6b08c40a2f3498234)

## minimum target
- (X) `13.0`: SwiftUI가 아직 발전 단계이고, 13.0은 SwiftUI가 처음 나왔을 떄의 버전이기 떄문에 버그도 많고 문제가 많다는 의견들이 많았으나 이런 문제점들을 겪으면서 나아가야 성장에 도움이 될 것이라고 판단하여 13.0을 minimum target으로 설정하게 되었다.
- (X) 추후에 버전을 올릴 순 있겠지만, 적어도 첫 배포까진 13.0을 유지할 생각이다.
- (2022.02.04) StateObject 및 async-await를 고려한 아키택처를 설계하기 위해 `15.0`으로 버전을 올림.

## 기능 목록과 이슈 처리
기획자가 없기 때문에 개발과 학습을 병행하며 정리할 계획이고, 기능이나 버그에 관련된 내용은 git issue를 적극적으로 활용할 예정이다.

## log 기록
참여자가 모두 직장인이기도 하고, 야근이라도 하는 날엔 참여 자체를 못하는 날도 많기 때문에 시간을 내는 것이 쉽지 않다. 또한, 학습을 병행하는 프로젝트라서 개발을 하나도 진행하지 못하는 날도 분명 있을 것이라고 생각한다. 

그래서 직접 개발에 기여를 못한 날이더라도, 어떤 부분을 학습했는지 또는 어떤 이유 때문에 참여를 못했는지 간략하게 로그를 작성하는 것을 원칙으로 한다. (SeokBA 제외)

로그 작성은 `main` branch에 작성하는 것을 원칙으로 한다.

## 개발 기간
단 기간에 급하게 마무리 지을 생각이 없는 프로젝트이기 때문에 정해진 기간은 없다. 시간이 오래걸리더라도 높은 퀄리티를 만들어내는 것이 목표다.

## ground rule
- 단 시간에 많은 작업을 하는 것은 지양하고, 지속적으로 꾸준히 수행하는 것을 지향한다. 
    - 개발기간에서도 서술 했듯이 모든 것들을 급하게 진행할 생각이 전혀 없다. 하지만, 꾸준하게 활동을 조금씩이더라도 지속했으면 좋겠고 이 프로젝트를 하며 같이 성장했으면 좋겠다. 
- 참여가 힘들다면 언제든 그만둘 수 있고, 다시 재참여도 가능하다.
