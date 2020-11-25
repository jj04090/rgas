package org.goal.rgas.payment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

/**
 * @author plusperson@gmail.com
*/
@Mapper
public interface PaymentMapper {
    public List<Payment> list(Payment payment) throws Exception;
    public Payment select(Payment payment) throws Exception;
    public void insert(Payment payment) throws Exception;
    public void delete(Payment payment) throws Exception;
}