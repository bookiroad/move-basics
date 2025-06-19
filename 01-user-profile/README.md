# Move Basics - User Profile Management

Move 언어로 구현한 사용자 프로필 관리 스마트 컨트랙트 실습입니다.


## 🎯 실습 개요

블록체인에서 사용자 프로필을 생성, 조회, 업데이트하는 기본적인 CRUD 기능을 Move 언어로 구현했습니다.


## 📝 코드 설명

### 1. UserProfile 구조체

```
move
struct UserProfile has key {
    username: String,     // 사용자명
    id: u64,             // 사용자 ID  
    is_verified: bool    // 인증 상태
}
```
### 2. 핵심 함수들

1. initialize_profile: 새로운 사용자 프로필을 블록체인에 저장
2. update_profile: 기존 프로필 정보를 수정
3. get_profile_details: 저장된 프로필 정보를 조회


## 🧪 테스트 결과

```
=== Testing Profile Storage ===
Profile initialized successfully!
Retrieved profile details:
Username: Bookiroad
ID: 1001
Verified: false
```
![image](https://github.com/user-attachments/assets/10f434ad-3398-4f60-a2a3-83738e687af3)

```
=== Updating Profile Storage ===
Profile updated successfully!
Updated profile details:
Username: Updated_Bookiroad
ID: 2002
Verified: true

Test completed successfully!
```
![image](https://github.com/user-attachments/assets/94e3923b-e856-4e22-8a83-9acc0dba9c36)



## 💡 학습 포인트
이 간단한 실습을 통해 Move 언어의 핵심 개념들을 학습할 수 있었습니다:

### 1. 리소스 모델 (Resource Model)
- has key 능력으로 글로벌 스토리지에 저장 가능
- move_to로 리소스를 계정에 이동
- borrow_global로 안전한 참조 접근

### 2. 소유권과 안전성
- acquires 키워드로 리소스 접근 명시
- 컴파일 타임에 리소스 안전성 보장
- 중복 리소스 생성 방지


## 🔗 관련 링크
https://x.com/Rahatcodes/status/1933605273647616006
https://x.com/Rahatcodes/status/1935386363865506157
