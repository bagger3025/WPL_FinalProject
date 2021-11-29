# 실행 흐름
home.jsp
- 로그인 하지 않을 경우: login.html
- 로그인 실패한 경우: login.html
- 로그인 성공한 경우
    - employer: employer.jsp로 이동
    - employee: employee.jsp로 이동
- 위의 모든 경우에 홈페이지는 /home이고, 새로고침해도 그 페이지가 유지되어야 함
    - ex) 로그인에 성공한 후 새로고침해도 여전히 employer.jsp나 employee.jsp가 불러져야 함
    - 이를 위해 쿠키를 사용해야 할 듯 (일정 시간이 지나면 expire해야함)

register.jsp
- home.jsp에서 로그인하지 않은 경우 이동할 수 있는 버튼을 누르면 이동함
- register에 실패할 경우 실패한 목록을 보여주는 시각적 효과가 있으면 될 듯, 즉 전 페이지로 돌아가진 않음
- 기본적으로 first name, id(username), password, validate password, email 등을 입력받고 추후에 더 입력받는 것에 따라 db 조정 필요함
- employer, employee 구분도 입력받아야 함


# 데이터베이스
전체 db명: WebDB

users: [id, user_name, password, first_name]이 있는 db table
- id: 사람에 따라 부여되는 고유값
- user_name: 사람들이 id로 입력하는 값
- password: 사람들이 password로 입력하는 값
- first_name: 사람들의 First Name을 String으로 저장
- gubun: employer, emplpoyee

post: [id, writer_id, title, contents]
- id: post에 따라 부여되는 고유값
- writer_id: users에 대응되는 사람의 id
- title: posting의 제목
- contents: posting의 내용
- finished: 종료되었다면 true, 모집중이라면 false

apply: [id, post_id, user_id]
- id: apply 목록의 고유한 id
- post_id: 해당하는 post의 id
- user_id: post_id에 지원한 users 테이블의 employee의 id
