# 실행 흐름
home.jsp
- If login fails: include login.html
- If login successes
    - employer: forward to employer.jsp
    - employee: forward to employee.jsp
- page should be same with refresh
    - ex) page should forward employer.jsp or employee.jsp
    - use session: https://velog.io/@max9106/JSP-Session%EC%84%B8%EC%85%98-j0k5ccyiub
    - give parameter using response.redirect with session: https://samdo0812.tistory.com/24

# Database
db name: webdb

DB import/export: https://goodteacher.tistory.com/131

Every table is set to utf-8

users: [key, user_id, password, first_name, gubun]이 있는 db table

|column name|type|attribute|comments|
|---|---|---|---|
|key|INT|PK,NN,UQ,AI||
|user_id|VARCHAR(32)|NN,UQ||
|password|VARCHAR(45)|NN||
|first_name|VARCHAR(45)|NN||
|last_name|VARCHAR(45)|NN||
|gubun|INT|NN|Foreign Key to gubuns.key|

gubuns: [key, gubun]

|column name|type|attribute|comments|
|---|---|---|---|
|key|INT|PK,NN,UQ,AI||
|gubun|String|NN,UQ|["EMPLOYER", "EMPLOYEE"]|

post: [key, writer_key, title, contents, finished, money]

|column name|type|attribute|comments|
|---|---|---|---|
|key|INT|PK,NN,UQ,AI||
|writer_key|INT|NN|Foreign Key to users.key|
|title|VARCHAR(45)|NN|Charset=utf8|
|contents|TEXT|NN|Charset=utf8|
|finished|TINYINT(1)|NN,UN,ZF|Default='0'|
|money|INT|NN||

apply: [key, post_key, user_key]

|column name|type|attribute|comments|
|---|---|---|---|
|key|INT|PK,NN,UQ,AI||
|post_key|INT|NN|Foreign Key to post.key|
|user_key|INT|NN|Foreign Key to users.key|

contactme: [key, userkey, title, message]
|column name|type|attribute|comments|
|---|---|---|---|
|key|INT|PK,NN,UQ,AI||
|userkey|INT|NN|Foreign Key to users.key|
|title|VARCHAR(45)|NN|Charset=utf8|
|message|TEXT|NN|Charset=utf8|

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
- https://alwaysleesh.tistory.com/13
    - posting Insert에 대한 설명

# TODO List
- [x] 회원가입 시 더 많은 input 점검이 필요 (password validate만 더 해주면 됨)
- [x] post 불러오는 것이 0개일 때도 되는지 점검 필요
- [x] employee에서 pagination 점검
- [x] finished인 job은 employee나 employer에서 띄워줄 때 따로 구별 필요
- [x] 월급, 시급 등 급여 정보가 추가되어야 함
- [x] 회원가입을 DB와 연동
- [x] job에 대해 employee가 apply할 수 있도록 연동
- [x] job에 대해 employer가 apply를 볼 수 있도록 연동
- [x] Finish된 job은 apply할 수 없도록 변경
- [x] css 적용 (bootstrap?)
- [x] contact me 페이지 만들기
- [ ] 한국어로 작성하면 저장되지 않는 문제 - 영어만 저장하도록 약속
- [x] password validate 추가해야함
- [x] register page에서 오류가 났을 때 표시해주는 장치가 있어야 함
- [x] id 검사하는 장치가 필요
- [x] register page에서 실시간 검사
- [x] login page에서 알람 표시 및 간격 조절