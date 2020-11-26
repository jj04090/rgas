package org.goal.rgas.perform;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.goal.rgas.member.Member;
import org.goal.rgas.member.MemberMapper;
import org.goal.rgas.mission.Mission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class PerformServiceImpl implements PerformService{
	@Autowired
	private PerformMapper performMapper;

	@Override
	public void performRegister(MultipartFile file, Perform perform) {
		try {
			String path = System.getProperty("user.home") + File.separator + "rgasPhoto";

			new File(path).mkdir();

			String logical = file.getOriginalFilename();
			String physical = UUID.randomUUID().toString().substring(0,8) + "_" +  logical;
			
			String filePath = path + File.separator + physical;
			file.transferTo(new File(filePath));
			
			perform.setLogical(logical);
			perform.setPhysical(physical);
			
			performMapper.insert(perform);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void performEdit(MultipartFile file, Perform perform) {
		try {
			String path = System.getProperty("user.home") + File.separator + "rgasPhoto";
			
			new File(path).mkdir();
			
			String logical = file.getOriginalFilename();
			String physical = UUID.randomUUID().toString().substring(0,8) + "_" +  logical;
			
			String filePath = path + File.separator + physical;
			file.transferTo(new File(filePath));
			
			perform.setLogical(logical);
			perform.setPhysical(physical);
			
			performMapper.update(perform);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Perform> performList(Perform perform) throws Exception {
		
		return performMapper.list(perform);
	}

	@Override
	public Perform performInquiry(Perform perform) throws Exception {
		
		return performMapper.select(perform);
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