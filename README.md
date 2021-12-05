# 실행 흐름
home.jsp
- 로그인 하지 않을 경우: login.html를 forward
- 로그인 실패한 경우: login.html를 forward
- 로그인 성공한 경우
    - employer: employer.jsp로 forward
    - employee: employee.jsp로 forward
- 새로고침해도 그 페이지가 유지되어야 함
    - ex) 로그인에 성공한 후 새로고침해도 여전히 employer.jsp나 employee.jsp가 forward 되어야 함
    - 이를 위해 세션을 사용: https://velog.io/@max9106/JSP-Session%EC%84%B8%EC%85%98-j0k5ccyiub
    - response.redirect를 이용하여도 parameter을 주는 방법(세션 이용): https://samdo0812.tistory.com/24

register.jsp
- home.jsp에서 로그인하지 않은 경우 이동할 수 있는 버튼을 누르면 이동
- register에 실패할 경우 실패한 목록을 보여주는 시각적 효과가 있으면 될 듯, 즉 전 페이지로 돌아가진 않음
- 기본적으로 first name, id(username), password, validate password, employer과 employee 구분 등을 입력받고 추후에 더 입력받는 것에 따라 db 조정 필요함

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

gubuns: [key, gubun]

|column name|type|attribute|comments|
|---|---|---|---|
|key|INT|PK,NN,UQ,AI||
|gubun|String|NN,UQ|["EMPLOYER", "EMPLOYEE"]|

post: [key, writer_key, title, contents, finished]

|column name|type|attribute|comments|
|---|---|---|---|
|key|INT|PK,NN,UQ,AI||
|writer_key|INT|NN|Foreign Key to users.key|
|title|VARCHAR(45)|NN|Charset=utf8|
|contents|TEXT|NN|Charset=utf8|
|finished|TINYINT(1)|NN,UN,ZF|Default='0'|

TODO: 시급? 월급? 그리고 위치? 등등..

apply: [key, post_key, user_key]

|column name|type|attribute|comments|
|---|---|---|---|
|key|INT|PK,NN,UQ,AI||
|post_key|INT|NN|Foreign Key to post.key|
|user_key|INT|NN|Foreign Key to users.key|

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
- [ ] 회원가입 시 더 많은 input 점검이 필요
- [ ] post 불러오는 것이 0개일 때도 되는지 점검 필요
- [ ] employee에서 pagination 점검
- [ ] finished인 job은 employee나 employer에서 띄워줄 때 따로 구별 필요
- [ ] 월급, 시급 등 급여 정보가 추가되어야 함
- [x] 회원가입을 DB와 연동
- [ ] job에 대해 employee가 apply할 수 있도록 연동
- [ ] job에 대해 employer가 apply를 볼 수 있도록 연동
- [ ] Finish된 job은 apply할 수 없도록 변경