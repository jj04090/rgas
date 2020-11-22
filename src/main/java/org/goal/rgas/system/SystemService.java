package org.goal.rgas.system;

import org.goal.rgas.member.Member;

public interface SystemService {
	public boolean login(Member member);
	public void logout();
}
