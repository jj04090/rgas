package org.goal.rgas.mission;

import java.io.File;
import java.nio.file.Files;
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
	private HttpSession httpSession;

	@Autowired
	private MissionMapper missionMapper;
	
	@Autowired
	private CategoryMapper categoryMapper; 
	
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
	
	//이미지 출력
	@Override
	public byte[] photoView(Mission mission) throws Exception{
		String path = System.getProperty("user.home") + File.separator + "rgasPhoto";
		String physical = missionMapper.select(mission).getPhysical();
		String imgPath = path + File.separator + physical;

		File file = new File(imgPath);

		if (file != null) {
			byte[] byteToFile = Files.readAllBytes(file.toPath());
			
			return byteToFile;
		}
		
		return null;
	}
	
	@Override
	public List<Category> categoryList() throws Exception{
		List<Category> categoryList = categoryMapper.list(new Category());
		
		return categoryList;
	}
}
