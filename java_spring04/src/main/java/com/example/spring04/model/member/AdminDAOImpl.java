package com.example.spring04.model.member;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository		// 데이터 처리 저장소
public class AdminDAOImpl implements AdminDAO {
	
	@Inject		// 의존관계 주입
	SqlSession sqlSession;
	
	@Override
	public String login(MemberDTO dto) {
		// TODO Auto-generated method stub
		// selectOne : 레코드 1개, 네임스페이스.아이디
		return sqlSession.selectOne("admin.login", dto);		// xml의 <mapper namespace="admin">의 namespace와   xml의 select id="login" 의 id이다
	}

}
