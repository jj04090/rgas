package org.goal.rgas.mission;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.goal.rgas.member.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MissionServiceImpl implements MissionService {
	@Autowired
	private MissionMapper missionMapper;

	@Autowired
	private HttpSession httpSession;

	// 미션 등록
	@Override
	public Mission missionRegister(MultipartFile file, Mission mission) throws Exception {
		try {
			String path = System.getProperty("user.home") + File.separator + "rgasPhoto";

			new File(path).mkdir();

			// 사진 논리,물리명 생성
			String logical = file.getOriginalFilename();
			String physical = UUID.randomUUID().toString().substring(0, 8) + "_" + logical;

			mission.setLogical(logical);
			mission.setPhysical(physical);
			mission.setStatus('N');

			// 사진 저장
			String filePath = path + File.separator + physical;
			file.transferTo(new File(filePath));

			Member member = (Member) httpSession.getAttribute("memberValue");

			mission.setMemberNo(member.getNo());
			missionMapper.insert(mission);

			return missionMapper.select(mission);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	// 미션 목록 조회
	@Override
	public List<Mission> missionList(Mission mission) throws Exception {

		return missionMapper.list(mission);
	}

	// 미션 상세 조회
	@Override
	public Mission missionInquiry(Mission mission) throws Exception {

		return missionMapper.select(mission);
	}

	// 미션 정보 수정
	@Override
	public void missionModify(Mission mission) throws Exception {

		missionMapper.update(mission);
	}

	// 미션 삭제
	@Override
	public void missionDelete(Mission mission) throws Exception {

		missionMapper.delete(mission);
	}
}
