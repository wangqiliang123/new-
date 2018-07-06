package cn.itcast.crm.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.itcast.crm.entity.Customer;
import cn.itcast.crm.service.ICustomerService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/**
 * 动作类
 * @author Johnny.Chen
 *
 */
@Controller("customerAction")
@Scope("prototype")
//============上面是spring的注解，下面就是Struts2的注解====================
@ParentPackage("myDefault")
@Namespace("/customer")
public class CustomerAction extends ActionSupport implements ModelDriven<Customer> {

    //模型驱动封装请求参数
    private Customer customer  = new Customer();
    @Override
    public Customer getModel() {
        return customer;
    }
    //注入service
    @Autowired
    private ICustomerService cs;
    
    /**
     * 跳转到添加客户的页面
     * @return
     */
    @Action(value="addCustomerUI",results={
            @Result(name="addCustomerUI",type="dispatcher",location="/jsp/customer/add.jsp")
    })
    public String addCustomerUI(){
        return "addCustomerUI";
    }
    
    /**
     * 保存客户
     * @return
     */
    @Action(value="addCustomer",results={
            @Result(name="success" ,type="dispatcher" ,location="/jsp/success.jsp")
    })
    public String addCustomer(){
        cs.saveCustomer(customer);
        return SUCCESS;
    }
    
    /**
     * 查询所有客户
     * @return
     */
    private List<Customer> customers;//2、全局属性传递参数
    @Action(value="findAllCustomer",results={
            @Result(name="findAllCustomer" ,type="dispatcher" ,location="/jsp/customer/list.jsp")
    })
    public String findAllCustomer(){
        //1、查询客户列表
        customers = cs.findAllCustomer();
        //2、跳转页面
        return "findAllCustomer";
    }

    
    //===================================================
    public void setCustomers(List<Customer> customers) {
        this.customers = customers;
    }
    public List<Customer> getCustomers() {
        return customers;
    }
    
    
    
    

}
