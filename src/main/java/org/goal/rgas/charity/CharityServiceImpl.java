package org.goal.rgas.charity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CharityServiceImpl implements CharityService {
	@Autowired
	private CharityMapper charityMapper;

	// 기부 단체 등록
	@Override
	public void charityRegister(Charity charity) throws Exception {
		charityMapper.insert(charity);
	}

	// 기부 단체 목록 조회
	@Override
	public List<Charity> charityList(Charity charity) throws Exception {
		List<Charity> list = charityMapper.list(charity);
		return list;
	}

	// 기부 단체 단일 조회
	@Override
	public Charity charityInquiry(Charity charity) throws Exception {
		return charityMapper.select(charity);
	}

	// 기부 단체 수정
	@Override
	public void charityModify(Charity charity) throws Exception {
			charityMapper.update(charity);
	}

	// 기부 단체 삭제
	@Override
	public void charityDelete(Charity charity) throws Exception {
			charityMapper.delete(charity);
	}
}
