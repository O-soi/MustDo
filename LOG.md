# MustDo LOG
> 활동 기록이 목적인 파일

### BEOMKEY
- 2022.01.20
    - readme 작성
    - 기존에 개인 repo에서 작업한 작업물 이동
- 2022.01.21
    - Clean SwiftUI 샘플 프로젝트 학습
        - DIContainer 의존성 주입 function 정리
        - AppState 구현 방식 정리
        - SwiftUI 학습 코멘트
        - Binding에 대해 학습할 필요가 있음. 공식문서 보고 번역해볼 예정
- 2022.01.24
    - Clean SwiftUI 샘플 프로젝트 학습
        - Binding 정리
            - source of truth <- 하나의 원천.. 아직 개념이 많이 어렵지만, value에 대한 싱크를 맞춰줄 필요 없다고 이해하면 될 듯하다.
            - state property를 자식 view에 주입할 때 쓰고, 또는 state property에 prefix에 $를 붙여주면 binding이 반환된다. 
            - 학습을 하고나서, Environment를 주입하는 것과 혼동이 좀 있었다.
            - environment는 전체 hierarchy에 해당되는 value이고, 주입했다고해서 계층구조로 접근한게 아니라 Environment를 통해 직접 전달된다.
            - 가장 결정적인 차이는 Environment는 Read-Only라는 것이다. Binding은 Read-Write이다.
        - LoadableSubject 학습
            - 외부에서 주입받아서 처리되는 동작이 잘 이해가 가질 않았는데 Binding을 정리하고 나서 비로소 이해할 수 있었다.
            - state property를 주입받아서 API Call한 결과 값을 주입받은 state property에 설정해준다. 전반적인 Interactor 방식을 이해한 것 같다.
### FELIX
