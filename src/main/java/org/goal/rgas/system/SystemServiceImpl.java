package org.goal.rgas.system;

import javax.servlet.http.HttpSession;

import org.goal.rgas.member.Member;
import org.goal.rgas.member.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SystemServiceImpl implements SystemService{
	@Autowired
	private MemberMapper memberMapper;
	@Autowired 
	private HttpSession httpSession;

	@Override
	public boolean login(Member member) throws Exception {
		member = memberMapper.select(member);
		httpSession.setAttribute("memberValue", member);
		
		if (member != null && member.getNo() != 0 
				&& member.getAuth() == 'C' && member.getStatus() == 'A') {
			
			httpSession.setAttribute("auth", "C");
			httpSession.setAttribute("email", member.getEmail());

			return true;
		} else if (member != null && member.getNo() != 0
				&& member.getAuth() == 'A' && member.getStatus() == 'A') {
			
			httpSession.setAttribute("auth", "A");
			httpSession.setAttribute("email", member.getEmail());
			
			return true;
		} else {
			
			return false;
		}
	}

	@Override
	public void logout() {
		if("A".equals(httpSession.getAttribute("auth"))
				|| "C".equals(httpSession.getAttribute("auth"))) {
			httpSession.invalidate();		
		}
	}
}
