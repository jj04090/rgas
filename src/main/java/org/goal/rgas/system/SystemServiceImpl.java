package org.goal.rgas.system;

import javax.servlet.http.HttpSession;

import org.goal.rgas.member.Member;
import org.goal.rgas.member.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SystemServiceImpl implements SystemService {
	@Autowired
	private HttpSession httpSession;

	@Autowired
	private MemberMapper memberMapper;

	@Override
	public boolean login(Member member) throws Exception {
		member = memberMapper.select(member);

		if (member != null && member.getNo() != 0 && member.getStatus() == 'A') {
			httpSession.setAttribute("auth", String.valueOf(member.getAuth()));
			httpSession.setAttribute("memberValue", member);

			return true;
		} else {

			return false;
		}
	}

	@Override
	public void logout() {
		if (httpSession.getAttribute("auth") != null) {
			httpSession.invalidate();
		}
	}
	
}
