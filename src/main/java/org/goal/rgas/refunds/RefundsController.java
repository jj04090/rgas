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
	public RefundsServiceImpl refundsServiceImpl;
	
	@PostMapping
	public boolean refundsProcess(@RequestBody Mission mission) {
		System.out.println(mission.getNo());
		//ModelAndView mv = new ModelAndView(new RedirectView("mission"));
		boolean flag = false;
		try {
			flag = refundsServiceImpl.refundsProcess(mission);
		} catch (Exception e) {
			//에러페이지
			e.printStackTrace();
		}
		return flag;
	}
}