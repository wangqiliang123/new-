package cn.itcast.crm.dao;

import java.util.List;

import cn.itcast.crm.entity.Customer;

/**
 * 持久层接口
 * @author Johnny.Chen
 *
 */
public interface ICustomerDao {

    /**
     * 保存
     * @param c
     */
    void save(Customer c);

    /**
     * 查询
     * @return
     */
    List<Customer> findAllCustomer();

}
