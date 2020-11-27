package org.goal.rgas.donation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

/**
 * @author plusperson@gmail.com
 */
@Mapper
public interface DonationTransferMapper {
	public List<DonationTransfer> list(DonationTransfer donationTransfer) throws Exception;

	public void insert(DonationTransfer donationTransfer) throws Exception;
}