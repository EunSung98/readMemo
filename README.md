# 감상일기
---
## 소개
- 과제로 만든 독서 기록 웹사이트
- 읽고 나서 끝이 아니라 짧게라도 감상을 적으려는 의도로 제작
- 다른 사람에게 보여주는 용도가 아닌 나만 보도록 한다

## 개발 기간 
- 2023.05 ~ 2023.06 (약 1달)

## 핵심 기능
1) 메인 화면
- 로그인 / 회원가입 선택
2) 로그인 & 회원가입 (로그아웃)
3) 독서록 기록
- 독서록 등록, 보기, 수정, 삭제 기능

## 역할
요약 : 기획, DB, 웹사이트 (1인 제작)
- onsubmit로 유효성 검사를 진행해 경고창 띄우기
- cookie로 아이디 저장 기능  →  로그아웃 후에도 아이디가 저장
- DB를 이용해 독서록을 보기/쓰기/수정/삭제
- 책 제목, 저자, 독서록 내용을 ㅁ입력/수정  →  입력/수정한 날짜와 함께 저장되어 표시
- 로그인을 하면 id를 session에 저장  →   해당 id와 연결된 Table과 연동
- 로그아웃 -> session에 저장되어 있는 id를 삭제  →  첫번째 페이지로 이동

![](https://github.com/EunSung98/readMemo/assets/77737044/eddb18df-9172-4273-a060-b0ff0e583b7e)

---
## [ 사이트 구조 ]
- 로그인과 회원가입 부분
- 감상 일기 부분
- 공통으로 사용하는 페이지
- 각 부분마다 DO,DAO 다르게 설정

![image](https://github.com/EunSung98/readMemo/assets/77737044/e71fe4f2-aa7e-41b0-b710-f777574d0d8c)

## culturememo DB의 ERD
![image](https://github.com/EunSung98/readMemo/assets/77737044/0c1b8bb3-c385-4bc5-9784-e3868712a951)
- 회원 아이디를 books 테이블의 외래키로 지정해 연결
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
![image](https://github.com/EunSung98/readMemo/assets/77737044/d3bbcfb4-fe73-45b7-8656-9b792c88b7f5)

로그인
(firstStep/login.jsp)
![image](https://github.com/EunSung98/readMemo/assets/77737044/58ac383b-b003-4423-94ec-b34762e10d78)


---
### < 감상문 등록 & 전체 보기 >
- 제목, 저자, 감상문을 입력해서 저장
- 감상문 등록 (memo/upload.jsp)
- 감상문 전체 보기 (memo/diary.jsp)

![image](https://github.com/EunSung98/readMemo/assets/77737044/3233edc3-8cf4-4060-88fc-44fc1ba931f4)

---
### < 감상문 수정하기 >

- 제목, 저자, 감상문을 수정해서 저장
- 감상문 수정(memo/modify.jsp)

![image](https://github.com/EunSung98/readMemo/assets/77737044/de6498a7-ae43-413e-b832-a823fc18d237)


---
### < 감상문 삭제하기 >

- 삭제 버튼으로 삭제하기

![image](https://github.com/EunSung98/readMemo/assets/77737044/9d561d6a-33fb-4a8e-a30a-5f435a7ca62b)


---
### < 감상문 로그아웃, 아이디 저장 >

- 로그아웃 버튼으로 session에 있는 id 값 삭제
- 로그인 페이지의 아이디 저장으로 쿠키에 남은 id 값

![image](https://github.com/EunSung98/readMemo/assets/77737044/58f1976f-4761-4894-af66-223f10c2e4a8)

