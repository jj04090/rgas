package org.goal.rgas.perform;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.goal.rgas.member.MemberMapper;
import org.goal.rgas.mission.Mission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class PerformServiceImpl implements PerformService{
	@Autowired
	private PerformMapper performMapper;
	@Autowired
	private HttpSession httpSession;
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public void performRegister(MultipartFile file, Perform perform) {
		try {
			//물리명, 논리명 생성
			String path = "C:\\Users\\suhyu\\rgasPhoto";
			String logical = file.getOriginalFilename();
			String physical = UUID.randomUUID().toString().substring(0,8) + "_" +  logical;
			
			//경로에 사진파일 저장
			String filePath = path + "//" + physical;
			file.transferTo(new File(filePath));
			
			//perform객체에 물리명, 논리명, 상태값부여
			perform.setLogical(logical);
			perform.setPhysical(physical);
			perform.setStatus('N');
			
			//수행내역 등록
			performMapper.insert(perform);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Perform> performList(Perform perform) throws Exception {
		List<Perform> list = performMapper.list(perform);
		
		return list;
	}

	@Override
	public Perform performInquiry(Perform perform) throws Exception {
		Perform performValue = performMapper.select(perform);
		
		return performValue;
	}

	@Override
	public void performModify(Perform perform) throws Exception {
		performMapper.update(perform);
	}

	@Override
	public void performDelete(Perform perform) throws Exception {
		performMapper.delete(perform);
	}
}