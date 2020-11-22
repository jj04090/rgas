package org.goal.rgas.refunds;

import org.goal.rgas.mission.Mission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@RestController
@RequestMapping("/refunds")
public class RefundsController {
	@Autowired
	public RefundsServiceImpl refundsServiceImpl;
	
	@GetMapping
	public ModelAndView refundsProcess(Mission mission) {
		ModelAndView mv = new ModelAndView(new RedirectView("mission"));
		try {
			//반환 값이 boolean이 맞는가???
			refundsServiceImpl.refundsProcess(mission);
		} catch (Exception e) {
			//에러페이지
			e.printStackTrace();
		}
		return mv;
	}
}
