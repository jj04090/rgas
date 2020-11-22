package org.goal.rgas.mission;

import java.util.List;

public interface MissionService {
	public void missionRegister(Mission mission);
	public List<Mission> missionList(Mission mission);
	public Mission missionInquiry(Mission mission);
	public void missionModify(Mission mission);
	public void missionDelete(Mission mission);
	public int totalSuccessCount(Mission mission);
}
