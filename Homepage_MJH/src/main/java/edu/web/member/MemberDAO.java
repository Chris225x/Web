package edu.web.member;

public interface MemberDAO {
	// 멤버 등록
	public abstract int insert(MemberVO vo);
	
	// 회원 정보 전체 검색
	public abstract MemberVO select(String userid);
		   
   // 회원 정보  수정 
    public abstract int update(MemberVO vo);
    
    // 회원 정보 삭제 
    public abstract int delete(String userid);
    
    // 회원 로그인
    public abstract String select(String userid, String password); 
}
