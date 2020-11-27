package org.goal.rgas.refunds;

import org.goal.rgas.mission.Mission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
@RequestMapping("/refunds")
public class RefundsController {
	@Autowired
	private RefundsServiceImpl refundsServiceImpl;
	
	//환급 정보 조회
	@PostMapping
	public int refundsProcess(@RequestBody Mission mission) {
		int flag = 0;
		try {
			flag = refundsServiceImpl.refundsProcess(mission);
		} catch (Exception e) {
			//에러페이지
			e.printStackTrace();
		}
		return flag;
	}
}