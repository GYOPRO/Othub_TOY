package member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("memberdao")
public interface MemberDAO {
	
	
	//회원가입
	public void insertMember(MemberDTO dto) ;
	
	//로그인체크
	public String insertCheck(MemberDTO dto) ;
	
	//회원정보조회
	public MemberDTO selectOneMember(String m_id);
	
	//회원정보수정
	public void updateMember(MemberDTO dto);
	
	//아이디체크
	public int checkId(String m_id);

	//회원탈퇴
	public void deleteMember(String m_id);
	
	//회원 리스트 조회(가입일자 순)
	public List<MemberDTO> selectMemberList();
	
	//회원 리스트 조회(아이디 순)
	public List<MemberDTO> selectMemberListId();
	
	//회원 리스트 조회(이름 순)
	public List<MemberDTO> selectMemberListName();
	
	//관리자 회원정보수정
	public void updateMemberByAdmin(MemberDTO dto);
	
	//관리자 회원 탈퇴
	public void deleteMemberByAdmin(String m_id);
	
	//회원 리스트 조회(일반 회원 조회)
	public List<MemberDTO> selectUserList();
	
	//일반 회원 등급 변경
	public void updateUserRole(MemberDTO dto);
	
	//쿠폰 체크(실버)
	public int couponCheckSilver(String m_id);
	
	//쿠폰 체크(실버)
	public int couponCheckGold(String m_id);
		
	//쿠폰 체크(실버)
	public int couponCheckVip(String m_id);
	
	//쿠폰 생성(실버)
	public void insertCouponSilver(String m_id);
	
	//쿠폰 생성(골드)
	public void insertCouponGold(String m_id);
		
	//쿠폰 생성(vip)
	public void insertCouponVip(String m_id);
	
	//my쿠폰 리스트
	public List<couponDTO> selectCoupon(String m_id);
	
	public void updateDate(String m_id, String period);
	
	//지호
	//포인트 적립
	public void updatePoint(PointDTO pdto) throws Exception;
		
	//포인트 조회
	public PointDTO countPoint(String m_id);
	
}





