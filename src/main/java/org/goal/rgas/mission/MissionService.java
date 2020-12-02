package org.goal.rgas.mission;

import java.util.List;

import org.goal.rgas.member.Member;
import org.springframework.web.multipart.MultipartFile;

public interface MissionService {
	public Mission missionRegister(MultipartFile file, Mission mission) throws Exception;

	public List<Mission> missionList(Mission mission) throws Exception;

	public Mission missionInquiry(Mission mission) throws Exception;

	public void missionModify(Mission mission) throws Exception;

	public void missionDelete(Mission mission) throws Exception;

	public byte[] photoView(Mission mission) throws Exception;

	public List<Category> categoryList() throws Exception;
}
