# 실행 흐름
home.jsp
- 로그인 하지 않을 경우: login.html
- 로그인 실패한 경우: login.html
- 로그인 성공한 경우
    - employer: employer.jsp로 이동
    - employee: employee.jsp로 이동
- ~~위의 모든 경우에 홈페이지는 /home이고~~, 새로고침해도 그 페이지가 유지되어야 함
    - ex) 로그인에 성공한 후 새로고침해도 여전히 employer.jsp나 employee.jsp가 불러져야 함
    - 이를 위해 쿠키를 사용해야 할 듯 (일정 시간이 지나면 expire해야함)

register.jsp
- home.jsp에서 로그인하지 않은 경우 이동할 수 있는 버튼을 누르면 이동함
- register에 실패할 경우 실패한 목록을 보여주는 시각적 효과가 있으면 될 듯, 즉 전 페이지로 돌아가진 않음
- 기본적으로 first name, id(username), password, validate password, email 등을 입력받고 추후에 더 입력받는 것에 따라 db 조정 필요함
- employer, employee 구분도 입력받아야 함


# 데이터베이스
전체 db명: webdb

DB import/export 방법: https://goodteacher.tistory.com/131

모든 Table은 utf8로 지정

users: [key, user_id, password, first_name, gubun]이 있는 db table

|column name|type|attribute|comments|
|---|---|---|---|
|key|INT|PK,NN,UQ,AI||
|user_id|VARCHAR(32)|NN,UQ||
|password|VARCHAR(45)|NN||
|first_name|VARCHAR(45)|NN||
|last_name|VARCHAR(45)|NN||
|gubun|INT|NN|Foreign Key to gubuns.key|

- key(INT): 사람에 따라 부여되는 고유값
    - PK, NN, UQ, AI
- user_id(VARCHAR(32)): 사람들이 id로 입력하는 값
    - NN, UQ
- password(VARCHAR(45)): 사람들이 password로 입력하는 값
    - NN
- first_name(VARCHAR(45)): 사람들의 First Name을 String으로 저장
    - NN
- last_name(VARCHAR(45)): 사람들의 Last Name을 String으로 저장
    - NN
- gubun(INT): employer, emplpoyee
    - NN
    - Foreign Key to gubuns.key

gubuns: [key, gubun]

|column name|type|attribute|comments|
|---|---|---|---|
|key|INT|PK,NN,UQ,AI||
|gubun|String|NN,UQ|["EMPLOYER", "EMPLOYEE"]|

- key(INT): gubun에 따라 부여되는 고유값
    - PK, NN, UQ, AI
- gubun: EMPLOYER, EMPLOYEE
    - NN, UQ

post: [key, writer_key, title, contents, finished]

|column name|type|attribute|comments|
|---|---|---|---|
|key|INT|PK,NN,UQ,AI||
|writer_key|INT|NN|Foreign Key to users.key|
|title|VARCHAR(45)|NN|Charset=utf8|
|contents|TEXT|NN|Charset=utf8|
|finished|TINYINT(1)|NN,UN,ZF|Default='0'|

- key(INT): post에 따라 부여되는 고유값
    - PK, NN, UQ, AI
- writer_key(INT): users에 대응되는 사람의 key
    - NN
    - Foreign Key to users.key
- title(VARCHAR(45)): posting의 제목
    - NN, Charset=utf8
- contents(TEXT): posting의 내용
    - NN, Charset=utf8
    - https://dev.mysql.com/doc/refman/8.0/en/storage-requirements.html (TEXT의 최대 크기는 2^16 bytes)
    - https://chess72.tistory.com/185 (BLOB과 TEXT의 차이점)
- finished(TINYINT): 종료되었다면 true, 모집중이라면 false
    - NN, ZF, Default=0

apply: [key, post_key, user_key]

|column name|type|attribute|comments|
|---|---|---|---|
|key|INT|PK,NN,UQ,AI||
|post_key|INT|NN|Foreign Key to post.key|
|user_key|INT|NN|Foreign Key to users.key|

- key(INT): apply 목록의 고유한 key
    - PK, NN, UQ
- post_key(INT): 해당하는 post의 key
    - NN
    - Foreign Key to post.key
- user_key(INT): post_key에 지원한 users 테이블의 employee의 key
    - NN
    - Foreign Key to users.key


# Other References
- https://doublesprogramming.tistory.com/58
    - ResultSet에서 자주 사용하는 메서드들
        - next(): 다음행으로 커서를 이동, 없다면 false를 리턴
        - getXxx(int columnIndex): columnIndex번째 컬럼 값을 Xxx 타입으로 가져옴
        - getXxx(String columnName): columnName 값을 Xxx 타입으로 가져옴
        - close(): ResultSet 객체를 반환
- https://installed.tistory.com/entry/8-JSP-%ED%8A%B9%EC%A0%95%ED%8E%98%EC%9D%B4%EC%A7%80%EB%A1%9C-%EC%9D%B4%EB%8F%99%EB%B0%A9%EB%B2%95
    1. Forward
        - pageContext.forward("이동할페이지");
        - <jsp:forward page="이동할페이지"/>
    2. Redirect
        - response.sendRdeirect("이동할페이지");
- https://futurists.tistory.com/17
    - Inner Join에 대한 설명