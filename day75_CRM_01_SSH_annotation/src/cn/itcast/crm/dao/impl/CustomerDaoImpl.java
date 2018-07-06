package cn.itcast.crm.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import cn.itcast.crm.dao.ICustomerDao;
import cn.itcast.crm.entity.Customer;

/**
 * 持久层实现类
 * @author Johnny.Chen
 *
 */
@Repository("customerDao")
public class CustomerDaoImpl implements ICustomerDao {
    
    //spring注入模板
    @Autowired
    private HibernateTemplate ht;

    /**
     * 保存
     */
    @Override
    public void save(Customer c) {
        ht.save(c);
    }

    /**
     * 查询
     */
    @Override
    public List<Customer> findAllCustomer() {
        return (List<Customer>) ht.find("from Customer");
    }

}
