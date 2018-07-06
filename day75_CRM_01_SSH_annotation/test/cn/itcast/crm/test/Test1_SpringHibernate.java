package cn.itcast.crm.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.itcast.crm.entity.Customer;
import cn.itcast.crm.service.ICustomerService;

/**
 * 测试Spring和hibernate的环境
 * @author Johnny.Chen
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)//替换运行器
@ContextConfiguration("classpath:/config/spring/applicationContext.xml")
public class Test1_SpringHibernate {
    
    @Autowired
    private ICustomerService cs;
    
    
    @Test
    public void test1(){
        Customer c = new Customer();
        c.setCustName("全王星球公司");
        cs.saveCustomer(c);
    }
    
    @Test
    public void test2(){
        List<Customer> list = cs.findAllCustomer();
        for (Customer customer : list) {
            System.out.println(customer);
        }
    }

}
