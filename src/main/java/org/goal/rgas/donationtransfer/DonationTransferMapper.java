package org.goal.rgas.donationtransfer;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

/**
 * @author plusperson@gmail.com
 */
@Mapper
public interface DonationTransferMapper {
	/* public int count(DonationTransfer donationTransfer) throws Exception; */
	public List<DonationTransfer> list(DonationTransfer donationTransfer) throws Exception;

	/* public DonationTransfer select(DonationTransfer donationTransfer) throws Exception; */
	public void insert(DonationTransfer donationTransfer) throws Exception;
	/*
	 * public void update(DonationTransfer donationTransfer) throws Exception;
	 * public void delete(DonationTransfer donationTransfer) throws Exception;
	 */
}