package cn.itcast.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.crm.dao.ICustomerDao;
import cn.itcast.crm.entity.Customer;
import cn.itcast.crm.service.ICustomerService;

/**
 * 业务层实现类： 
 *      事务在这里控制
 *  
 * @author Johnny.Chen
 *
 */
@Service("customerService")
@Transactional//全局事务：传播行为：REQUIRED        只读：false
public class CustomerServiceImpl implements ICustomerService {
    
    //spring注入dao
    @Autowired
    private ICustomerDao customerDao;
   

    /**
     * 保存客户
     */
    @Override
    public void saveCustomer(Customer c) {
        customerDao.save(c);

    }

    /**
     * 查询客户
     */
    @Override
    @Transactional(propagation=Propagation.SUPPORTS,readOnly=true)//局部事务
    public List<Customer> findAllCustomer() {
        return customerDao.findAllCustomer();
    }

}
