package org.goal.rgas.refunds;

import org.goal.rgas.mission.Mission;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/refunds")
public class RefundsController {
	@GetMapping
	public ModelAndView refundsProcess(Mission mission) {
		return null;
	}
}
