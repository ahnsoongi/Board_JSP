# *Jsp Board*

## 프로젝트 개요
- JSP 를 활용해 회원들끼리 소통할 수 있게 만든 회원제 게시판이다. 



## 프로젝트 정보
### 설치
- 파일들을 내려받아 eclipse java ee 에 import해서 apach tomcat server 에서 실행하십시오


### 구현 화면 설명
__로그인__
- 회원이라면 로그인에 이메일, 아이디, 비밀번호를 입력하고 "LOGIN" 버튼을 누른다. 
- 비회원이라면 "Create an account"를 누르고 회원가입화면으로 이동한다.

![image](https://user-images.githubusercontent.com/62640232/86861540-4e8a4000-c102-11ea-9981-3d9c5513ea75.png)


__회원가입__
- 비회원이라면 회원가입에서 아이디, 비밀번호, 이메일, 휴대폰번호, 이름을 입력하고 "CREATE" 버튼을 누른다.

![image](https://user-images.githubusercontent.com/62640232/86861044-264e1180-c101-11ea-8226-accf2b7ad3be.png)


__게시판 목록__
- 로그인하고 들어오면 게시판 목록 확인가능
- 글쓰기, 로그아웃 가능

![image](https://user-images.githubusercontent.com/62640232/86861860-03246180-c103-11ea-974a-4d122f4470f4.png)


__글쓰기__
- 게시판 목록에서 글쓰기를 누르고 들어와 이름과 이메일은 로그인할 때의 세션을 들고온다.
- 제목과 내용을 작성하고 파일 첨부를 한 다음 글쓰기 버튼을 누를 시에 게시판에 글 작성 완료

![image](https://user-images.githubusercontent.com/62640232/86862629-872b1900-c104-11ea-8106-f9c14280a7fa.png)


__글내용보기__
- 게시판 목록 중에서 제목을 클릭하면 글내용보기 화면으로 이동
- 첨부파일 다운로드가 가능하다.
- 글수정, 글삭제, 답글쓰기가 가능하고 다시 글목록으로 돌아가기도 가능하다.

![image](https://user-images.githubusercontent.com/62640232/86862928-26501080-c105-11ea-9a12-e08a58cc5270.png)


__글수정__
- 이름과 이메일은 세션을 받아 가져오고 제목과 내용을 입력하고 글수정을 완료한다.

![image](https://user-images.githubusercontent.com/62640232/86863110-7b8c2200-c105-11ea-92e2-b3bdd7537946.png)


__글삭제__
- 아이디와 비밀번호를 입력하고 글삭제가 가능하다.

![image](https://user-images.githubusercontent.com/62640232/86863170-9fe7fe80-c105-11ea-95a8-8a8601b3dcbf.png)


__답글쓰기__
- 제목과 내용을 입력하고 파일을 첨부한 다음 글쓰기를 한다.

![image](https://user-images.githubusercontent.com/62640232/86863363-fa815a80-c105-11ea-8e06-d8cbfcca7f7b.png)


__답글쓰기 확인__
- 게시판 목록에서 답글이 잘 쓰여진 것을 확인가능하다.

![image](https://user-images.githubusercontent.com/62640232/86863440-256bae80-c106-11ea-971e-414b7c8331f6.png)


__첨부파일 다운로드__
- 글내용보기에서 첨부 파일을 클릭하면 다운로드가 가능하다.

![image](https://user-images.githubusercontent.com/62640232/86863609-809da100-c106-11ea-8cde-4c57ee5b7b56.png)


__로그아웃__
- 게시판 목록에서 로그아웃을 클릭 시 "로그아웃 되었습니다" 알림이 뜬다.
- 알림 후 다시 로그인화면으로 이동한다.

![image](https://user-images.githubusercontent.com/62640232/86863722-b8a4e400-c106-11ea-816c-9ac0e06750bb.png)

![image](https://user-images.githubusercontent.com/62640232/86863822-edb13680-c106-11ea-9615-38a5866979d6.png)





