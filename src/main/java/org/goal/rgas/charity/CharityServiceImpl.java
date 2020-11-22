package org.goal.rgas.charity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CharityServiceImpl implements CharityService {
	@Autowired
	public CharityMapper charityMapper;

	//기부 단체 등록
	@Override
	public void charityRegister(Charity charity) throws Exception {
		if (charity != null) {
			charityMapper.insert(charity);
		}

	}

	//기부 단체 목록 조회
	@Override
	public List<Charity> charityList(Charity charity) throws Exception {
		List<Charity> list = charityMapper.list(charity);
		return list;
	}

	//기부 단체 단일 조회
	@Override
	public Charity charityInquiry(Charity charity) throws Exception {
		Charity charityValue = null;
		if (charity != null) {
			charityValue = charityMapper.select(charity);
		}
		return charityValue;
	}

	//기부 단체 수정
	@Override
	public void charityModify(Charity charity) throws Exception {
		if (charity != null) {
			charityMapper.update(charity);
		}
	}

	//기부 단체 삭제
	@Override
	public void charityDelete(Charity charity) throws Exception {
		if (charity != null) {
			charityMapper.delete(charity);
		}
	}
}
package org.goal.rgas.charity;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class CharityServiceImpl implements CharityService{

	@Override
	public void charityRegister(Charity charity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Charity> charityList(Charity charity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Charity charityInquiry(Charity charity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void charityModify(Charity charity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void charityDelete(Charity charity) {
		// TODO Auto-generated method stub
		
	}

}
