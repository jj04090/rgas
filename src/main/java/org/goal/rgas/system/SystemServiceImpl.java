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
		if (memberMapper.select(member) != null
				&& memberMapper.select(member).getNo() != 0
				&& memberMapper.select(member).getAuth() == 'C') {
			
			httpSession.setAttribute("auth", "C");
			httpSession.setAttribute("email", member.getEmail());

			return true;
		} else if (memberMapper.select(member) != null
				&& memberMapper.select(member).getNo() != 0
				&& memberMapper.select(member).getAuth() == 'A') {
			
			httpSession.setAttribute("auth", "A");
			httpSession.setAttribute("email", member.getEmail());
			
			return true;
		} else {
			
			return false;
		}
	}

	@Override
	public void logout() {
		if("common".equals(httpSession.getAttribute("auth"))
				|| "admin".equals(httpSession.getAttribute("auth"))) {
			
			httpSession.invalidate();		
		}
	}

}
