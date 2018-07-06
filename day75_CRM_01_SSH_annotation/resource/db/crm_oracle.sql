-- 创建用户

-- Create the user
create user crm
identified by passw0rd
default tablespace SYSTEM
temporary tablespace TEMP;

-- Grant/Revoke role privileges
grant connect to crm;
grant resource to crm;

-- Grant/Revoke system privileges
grant unlimited tablespace to crm;




-- 表数据：
/*创建客户表*/
CREATE TABLE cst_customer (
  cust_id bigint(32) NOT NULL AUTO_INCREMENT COMMENT '客户编号(主键)',
  cust_name varchar(32) NOT NULL COMMENT '客户名称(公司名称)',
  cust_source varchar(32) DEFAULT NULL COMMENT '客户信息来源',
  cust_industry varchar(32) DEFAULT NULL COMMENT '客户所属行业',
  cust_level varchar(32) DEFAULT NULL COMMENT '客户级别',
  cust_address varchar(128) DEFAULT NULL COMMENT '客户联系地址',
  cust_phone varchar(64) DEFAULT NULL COMMENT '客户联系电话',
  PRIMARY KEY (cust_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*创建联系人表*/
CREATE TABLE cst_linkman (
  lkm_id bigint(32) NOT NULL AUTO_INCREMENT COMMENT '联系人编号(主键)',
  lkm_name varchar(16) DEFAULT NULL COMMENT '联系人姓名',
  lkm_gender varchar(10) DEFAULT NULL COMMENT '联系人性别',
  lkm_phone varchar(16) DEFAULT NULL COMMENT '联系人办公电话',
  lkm_mobile varchar(16) DEFAULT NULL COMMENT '联系人手机',
  lkm_email varchar(64) DEFAULT NULL COMMENT '联系人邮箱',
  lkm_position varchar(16) DEFAULT NULL COMMENT '联系人职位',
  lkm_memo varchar(512) DEFAULT NULL COMMENT '联系人备注',
  PRIMARY KEY (lkm_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


/* 测试数据 ：客户表 */
insert  into cst_customer(cust_id,cust_name,cust_source,cust_industry,cust_level,cust_address,cust_phone) values (1,'传智播客集团','6','IT培训','23','广州天河珠吉路58号','020-66668888');
insert  into cst_customer(cust_id,cust_name,cust_source,cust_industry,cust_level,cust_address,cust_phone) values (2,'黑马训练营','6','IT培训','23','广州天河珠吉路58号','020-66668888');
insert  into cst_customer(cust_id,cust_name,cust_source,cust_industry,cust_level,cust_address,cust_phone) values (3,'小空电脑配件公司','7','电脑硬件','23','广州九巷','020-65085588');
insert  into cst_customer(cust_id,cust_name,cust_source,cust_industry,cust_level,cust_address,cust_phone) values (4,'贝吉塔汽车公司','7','汽车','22','广州九巷','020-68909090');


/* 测试数据 ：客户表 */
insert  into cst_linkman(lkm_id,lkm_name,lkm_gender,lkm_mobile,lkm_phone,lkm_email,lkm_position,lkm_memo,lkm_cust_id) values (1,'张老师','male','010-82935100','1388888888','zzz@itcast.cn','宣传部负责人','很负责',1);
insert  into cst_linkman(lkm_id,lkm_name,lkm_gender,lkm_mobile,lkm_phone,lkm_email,lkm_position,lkm_memo,lkm_cust_id) values (2,'刘老师','female','010-82935100','1377777777','lll@itcast.cn','全国统一咨询中心','很负责',1);
insert  into cst_linkman(lkm_id,lkm_name,lkm_gender,lkm_mobile,lkm_phone,lkm_email,lkm_position,lkm_memo,lkm_cust_id) values (3,'赵工','male','010-82935100','1399999999','zg@itcast.cn','黑马宣传中心','宣传责任人',2);
insert  into cst_linkman(lkm_id,lkm_name,lkm_gender,lkm_mobile,lkm_phone,lkm_email,lkm_position,lkm_memo,lkm_cust_id) values (4,'高管','female','010-82935100','1366666666','gg@itcast.cn','管理专员','管理',2);
insert  into cst_linkman(lkm_id,lkm_name,lkm_gender,lkm_mobile,lkm_phone,lkm_email,lkm_position,lkm_memo,lkm_cust_id) values (5,'李总','male','010-89986886','1355555555','lz@jxjt.com','总经理','企划负责人',3);
insert  into cst_linkman(lkm_id,lkm_name,lkm_gender,lkm_mobile,lkm_phone,lkm_email,lkm_position,lkm_memo,lkm_cust_id) values (6,'王董','male','010-80980990','1333333333','wd@jxjt.com','董事长','企业老大',3);
insert  into cst_linkman(lkm_id,lkm_name,lkm_gender,lkm_mobile,lkm_phone,lkm_email,lkm_position,lkm_memo,lkm_cust_id) values (7,'孙老板','male','010-80980990','1322222222','slb@xzjt.com','老板','一把手',4);
insert  into cst_linkman(lkm_id,lkm_name,lkm_gender,lkm_mobile,lkm_phone,lkm_email,lkm_position,lkm_memo,lkm_cust_id) values (8,'陈秘书','female','010-80980990','1311111111','cms@xzjt.com','秘书','二把手',4);



/*创建数据字典表*/
CREATE TABLE base_dict (
dict_id varchar(32) NOT NULL COMMENT '数据字典 id(主键)',
dict_type_code varchar(10) NOT NULL COMMENT '数据字典类别代码',
dict_type_name varchar(64) NOT NULL COMMENT '数据字典类别名称',
dict_item_name varchar(64) NOT NULL COMMENT '数据字典项目名称',
dict_item_code varchar(10) DEFAULT NULL COMMENT '数据字典项目(可为空)',
dict_sort int(10) DEFAULT NULL COMMENT '排序字段',
dict_enable char(1) NOT NULL COMMENT '1:使用 0:停用',
dict_memo varchar(64) DEFAULT NULL COMMENT '备注',
PRIMARY KEY (dict_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*数据字典表数据*/
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('1','001','客户行业','教育培训 ',NULL,1,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('10','003','公司性质','民企',NULL,3,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('12','004','年营业额','1-10 万',NULL,1,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('13','004','年营业额','10-20 万',NULL,2,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('14','004','年营业额','20-50 万',NULL,3,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('15','004','年营业额','50-100 万',NULL,4,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('16','004','年营业额','100-500 万',NULL,5,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('17','004','年营业额','500-1000 万',NULL,6,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('18','005','客户状态','基础客户',NULL,1,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('19','005','客户状态','潜在客户',NULL,2,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('2','001','客户行业','电子商务',NULL,2,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('20','005','客户状态','成功客户',NULL,3,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('21','005','客户状态','无效客户',NULL,4,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('22','006','客户级别','普通客户',NULL,1,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('23','006','客户级别','VIP 客户',NULL,2,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('24','007','商机状态','意向客户',NULL,1,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('25','007','商机状态','初步沟通',NULL,2,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('26','007','商机状态','深度沟通',NULL,3,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('27','007','商机状态','签订合同',NULL,4,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('3','001','客户行业','对外贸易',NULL,3,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('30','008','商机类型','新业务',NULL,1,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('31','008','商机类型','现有业务',NULL,2,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('32','009','商机来源','电话营销',NULL,1,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('33','009','商机来源','网络营销',NULL,2,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('34','009','商机来源','推广活动',NULL,3,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('4','001','客户行业','酒店旅游',NULL,4,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('5','001','客户行业','房地产',NULL,5,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('6','002','客户信息来源','电话营销',NULL,1,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('7','002','客户信息来源','网络营销',NULL,2,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('8','003','公司性质','合资',NULL,1,'1',NULL);
insert  into base_dict(dict_id,dict_type_code,dict_type_name,dict_item_name,dict_item_code,dict_sort,dict_enable,dict_memo) values ('9','003','公司性质','国企',NULL,2,'1',NULL);



