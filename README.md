# 감상일기
- 읽고 나서 끝이 아니라 짧게라도 감상을 적으려는 의도로 제작
- 다른 사람에게 보여주는 용도가 아닌 나만 보도록 한다

https://github.com/EunSung98/readMemo/assets/77737044/eddb18df-9172-4273-a060-b0ff0e583b7e

---
## [ 사이트 구조 ]
- 로그인과 회원가입 부분
- 감상 일기 부분
- 공통으로 사용하는 페이지
- 각 부분마다 DO,DAO 다르게 설정

![image](https://github.com/EunSung98/readMemo/assets/77737044/e71fe4f2-aa7e-41b0-b710-f777574d0d8c)

---
## [ 사이트 파일 내용 ]

1. 공통으로 사용하는 파일
![image](https://github.com/EunSung98/readMemo/assets/77737044/6413171f-1c08-4b9b-8063-b4aaaf36e5a9)

2. 로그인/회원가입 페이지
![image](https://github.com/EunSung98/readMemo/assets/77737044/e470aec7-a1fa-4520-b48e-9764281566b6)

3. 메인 페이지
![image](https://github.com/EunSung98/readMemo/assets/77737044/5735c337-2275-4c4c-b515-9ab38b7df5d8)

---
### < 회원가입/로그인 페이지 >
- 첫 번째 페이지에서 로그인 / 회원가입 선택
- 회원 가입 후, 로그인
- onsubmit을 이용해서 유효성 검사

회원가입 (firstStep/signUp.jsp)
![image](https://github.com/EunSung98/readMemo/assets/77737044/acb4fadd-ca8c-47fc-bbac-49d1193868d9)

로그인
(firstStep/login.jsp)
![image](https://github.com/EunSung98/readMemo/assets/77737044/00e2909f-da06-4e20-b909-2f55f4dc2236)

---
### < 감상문 등록 & 전체 보기 >
- 제목, 저자, 감상문을 입력해서 저장
- 감상문 등록 (memo/upload.jsp)
- 감상문 전체 보기 (memo/diary.jsp)

![image](https://github.com/EunSung98/readMemo/assets/77737044/ad792894-4294-4cc0-b4c3-77448bee1d78)

---
### < 감상문 수정하기 >

- 제목, 저자, 감상문을 수정해서 저장
- 감상문 수정(memo/modify.jsp)

![image](https://github.com/EunSung98/readMemo/assets/77737044/fd8099d9-f6f2-4816-87ae-64ec431ae5b2)

---
### < 감상문 삭제하기 >

- 삭제 버튼으로 삭제하기

---
### < 감상문 로그아웃, 아이디 저장 >

- 로그아웃 버튼으로 session에 있는 id 값 삭제
- 로그인 페이지의 아이디 저장으로 쿠키에 남은 id 값
