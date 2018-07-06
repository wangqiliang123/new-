package cn.itcast.crm.service;

import java.util.List;

import cn.itcast.crm.entity.Customer;

/**
 * 业务层接口
 * @author Johnny.Chen
 *
 */
public interface ICustomerService {
    
    /**
     * 保存客户
     * @param c
     */
    public void saveCustomer(Customer c);
    
    /**
     * 查询所有客户
     * @return
     */
    public List<Customer> findAllCustomer();

}
