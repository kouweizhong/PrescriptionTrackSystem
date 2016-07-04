drop table prescriptiondetail;
drop table subtitute;
drop table medicine;
drop table prescription;
drop table doctor;
drop table user;
drop table department;
drop table position;

/*table department*/
CREATE TABLE department (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(32) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*table position*/
CREATE TABLE position (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(32) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*table user*/
CREATE TABLE user (
  id int(11) NOT NULL AUTO_INCREMENT,
  birthday date DEFAULT NULL,
  insurance_company varchar(32) DEFAULT NULL,
  name varchar(32) DEFAULT NULL,
  policy_number varchar(32) DEFAULT NULL,
  telephone varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

/*table doctor*/
CREATE TABLE doctor (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(32) NOT NULL,
  password varchar(32) NOT NULL,
  telephone varchar(32) NOT NULL,
  did int(11) NOT NULL,
  pid int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_792mlfs5rujdrdhyf1ui3r4ns` (did),
  KEY `FK_ii7se5r2es8oytvb53bky4mn7` (pid),
  CONSTRAINT `FK_792mlfs5rujdrdhyf1ui3r4ns` FOREIGN KEY (did) REFERENCES department (id),
  CONSTRAINT `FK_ii7se5r2es8oytvb53bky4mn7` FOREIGN KEY (pid) REFERENCES position (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*table prescription*/
CREATE TABLE prescription (
  id int(11) NOT NULL AUTO_INCREMENT,
  begindate date DEFAULT NULL,
  crawlagainst int(11) DEFAULT NULL,
  enddate date DEFAULT NULL,
  did int(11) NOT NULL,
  uid int(11) NOT NULL,
  PRIMARY KEY (id),
  KEY `FK_esa5i3smngww2n8ffr381dq2g` (did),
  KEY `FK_jrh5u5cx2ckr8csofr4q4a8x` (uid),
  CONSTRAINT `FK_esa5i3smngww2n8ffr381dq2g` FOREIGN KEY (did) REFERENCES doctor (id),
  CONSTRAINT `FK_jrh5u5cx2ckr8csofr4q4a8x` FOREIGN KEY (uid) REFERENCES user (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*table prescriptiondetail*/
CREATE TABLE prescriptiondetail (
  id int(11) NOT NULL AUTO_INCREMENT,
  count int(11) DEFAULT '1',
  take_method varchar(255) DEFAULT NULL,
  unit varchar(16) DEFAULT NULL,
  mid int(11) NOT NULL,
  pid int(11) NOT NULL,
  PRIMARY KEY (id),
  KEY `FK_m0u26wt0jekm01pv5fma8yctp` (mid),
  KEY `FK_q2mkptfdkd05pvp3iei20fqua` (pid),
  CONSTRAINT `FK_m0u26wt0jekm01pv5fma8yctp` FOREIGN KEY (mid) REFERENCES medicine (id),
  CONSTRAINT `FK_q2mkptfdkd05pvp3iei20fqua` FOREIGN KEY (pid) REFERENCES prescription (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*table medicine*/
CREATE TABLE medicine (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(64) NOT NULL,
  sideeffect varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*table subtitute*/
CREATE TABLE subtitute (
  m_id int(11) NOT NULL,
  s_id int(11) NOT NULL,
  PRIMARY KEY (m_id,s_id),
  UNIQUE KEY `UK_mcs3umruqxpn9cori6y0a5crx` (s_id),
  CONSTRAINT `FK_8y4id2dfot9eeilmg1w0vuqmr` FOREIGN KEY (m_id) REFERENCES medicine (id),
  CONSTRAINT `FK_mcs3umruqxpn9cori6y0a5crx` FOREIGN KEY (s_id) REFERENCES medicine (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*department data*/
insert into department(name) values('妇产科');
insert into department(name) values('儿科');
insert into department(name) values('中医科');
insert into department(name) values('眼科');
insert into department(name) values('耳鼻喉科');
insert into department(name) values('口腔科');
insert into department(name) values('传染科');
insert into department(name) values('保健科');
insert into department(name) values('皮肤科');
insert into department(name) values('神经精神科');
insert into department(name) values('药剂科');
insert into department(name) values('营养科');
insert into department(name) values('放射科');
insert into department(name) values('病理科');
insert into department(name) values('手术科');
insert into department(name) values('麻醉科');
insert into department(name) values('急诊科');
insert into department(name) values('注射科');
insert into department(name) values('预诊科');
insert into department(name) values('门诊临床科');
insert into department(name) values('肿瘤科');
insert into department(name) values('产科');
insert into department(name) values('泌尿内科');
insert into department(name) values('脊柱外科');
insert into department(name) values('血液科');


/*position data*/
insert into position (name) values('医生');
insert into position (name) values('主治医生');
insert into position (name) values('副主治医生');
insert into position (name) values('化验员');
insert into position (name) values('治疗人员');
insert into position (name) values('护士');
insert into position (name) values('护士长');
insert into position (name) values('护工');

/*Doctor data
 select * from doctor d,department d1,position p where d.did=d1.id and d.pid=p.id;
 */
 insert into doctor (name,telephone,password,did,pid) values('袁子杰','15235678975','123456',20,5);
 insert into doctor (name,telephone,password,did,pid) values('高心','18335648965','123456',21,6);
 insert into doctor (name,telephone,password,did,pid) values('张三','13955568975','123456',22,7);
 
/*User data*/
insert into user (name,birthday,telephone,insurance_company,policy_number) values('邢弘清','2013-03-19','15902862489','太平洋承保公司','c7b7aaa5593f4c7d93298e3dad2ace2e');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('后震','2008-01-13','13005475701','太平洋承保公司','d5abecef743c42b69c2994307ae85609');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('佴飞良','2000-02-22','13505562591','太平洋承保公司','cdf6430330e149eb82c25e9983f88e67');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('关怡','2011-10-05','13104336445','太平洋承保公司','cd5aa7b1587c4e1a887d9c7da3331f0c');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('滑庆冠','2014-03-13','15507118172','太平洋承保公司','1d65dc87782d4799a36e0d5c4cc4402a');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('班冠','2013-06-19','15504691684','太平洋承保公司','7a2dc4e9a2904dc1a26d4e3a97b42d08');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('幸融','2011-10-05','13901433399','太平洋承保公司','bc8a2f3850f8473db01b87ca64edba73');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('聂松楠','2007-04-24','15702871983','太平洋承保公司','f21d18ee7ac24d109e36d4a7055b73cc');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('甘英','1995-04-25','13306679058','太平洋承保公司','e2d9188c1c264786a6dbae40b367046f');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('车民','2006-03-21','15305434513','太平洋承保公司','48fdbc74a37e4165b32c1d50ae23b3cf');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('毕敬伦','2011-08-14','15205335081','太平洋承保公司','eac8704744de4fe4b36fd59bd56bac74');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('离瑶','2005-11-09','15301683935','太平洋承保公司','98fec718a9254a37a5ce364920b95be4');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('姓清榕','2004-12-25','15902346581','太平洋承保公司','76b2f89ef00f451faca8700b1d07f430');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('武婵','2002-03-28','13507342199','太平洋承保公司','1af12765d5bd4c4ba84ca428ec5c0b4a');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('爱行','2003-08-01','15800777534','太平洋承保公司','b5c44dec4f3646a0b7366f15d75c849b');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('干茗','2000-12-04','15504640335','太平洋承保公司','1a832e00fae54dc29869898815d2964b');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('司馥','2004-06-30','13901572334','太平洋承保公司','d558f9b1879a414c805d1e6a818f9273');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('邢伯民','2014-04-17','15201538613','太平洋承保公司','c68204ff3b614cd8b20c898f542cdfb7');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('年荷','2008-02-15','13000695041','太平洋承保公司','2e3a3d509c244e3ca617f6eaadfedada');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('訾雪莲','2009-05-11','15206411073','太平洋承保公司','3cbe07a5a56d42cf867f3fc485d59807');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('晋琬娣','1995-04-24','13406048966','太平洋承保公司','66aebc98f9494070aa23577106820e4a');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('牟辰刚','1993-04-13','15508331166','太平洋承保公司','8428a8982bb94b568dbe1988aff41a5c');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('戴荷','2004-05-08','13701378389','太平洋承保公司','a4044f6ca8704f7695c200355d284143');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('贝伦','1998-07-27','15005963739','太平洋承保公司','f6fb5363f1ea4daca009f9a14de41ac4');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('殴旭','1994-10-21','15601827453','太平洋承保公司','f7dc158031784478bd56b955a08fe2b5');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('甘柔','2015-12-11','13002521655','太平洋承保公司','d5108191f696429187c09a93aef5d0d0');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('蒋琼真','1993-11-03','15908153361','太平洋承保公司','c1f52285c5d2492eb1d0e8308e50df64');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('司翠凝','2006-05-26','13001424752','太平洋承保公司','fb884c97c1634cc896c5783f215577b3');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('杨学','1997-02-16','13705425209','太平洋承保公司','98b533b38b774a75a8f20559b7440c3d');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('公欣妍','1990-10-18','13208023367','太平洋承保公司','932ecc73c6c84f129c4a41079fa684e1');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('公兰晶','2011-05-02','13607171560','太平洋承保公司','eff6a900716c483181a00b83e3c5677a');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('宫江成','2010-07-22','13206585211','太平洋承保公司','17c1d2babbba402c9ab142661bf3b4ee');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('祁欢咏','2001-01-09','15904583002','太平洋承保公司','009c533ec93240b6a273215e11b28e78');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('柳咏荷','2003-05-23','15700311704','太平洋承保公司','883ea11d001947beb563611a36dd1db7');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('翁岩谦','2007-08-05','15502805767','太平洋承保公司','f6af6990ef17464e9e7ef8d408ba8028');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('孙琳晓','1994-07-09','15708661144','太平洋承保公司','fa64991f3e4b4d3280dcc28ed5b8a34d');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('仲良伯','2013-04-25','13004965089','太平洋承保公司','9941f3052425425f84d33a70908ece2c');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('于克','1999-03-23','15100823114','太平洋承保公司','8bd0cd12332b4528b0234ea7fbedeee7');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('杨宁凡','1990-08-24','13303164334','太平洋承保公司','2dee9247926b429b9a08b4e97aa09cca');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('皮永之','1998-06-02','15500425581','太平洋承保公司','5a7708429ae7435cb82d880bc98286a0');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('阴惠','2011-08-17','13603893440','太平洋承保公司','23bc8952b1ff48c49892190c8b9adcf2');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('巴政','2001-08-21','13402383257','太平洋承保公司','5522f0ca04584dbfbcff87384456f63f');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('桓竹','1996-02-23','15304486640','太平洋承保公司','791bc982bcd44cc993b0ddd00b59eef4');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('唐豪松','2006-10-03','13707330029','太平洋承保公司','d31a1f4e13b14517abd17e0c7eda0c5f');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('督昭梅','2012-04-16','15701062020','太平洋承保公司','e453cbea18f547a391b454f49358f27b');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('宿菲','2003-11-23','13002431978','太平洋承保公司','575202a0b20d4ce7bb56ba1193e8cf7f');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('谢元刚','2012-04-13','15105891793','太平洋承保公司','a3beb5a945d34554b643705798357e64');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('太群建','1991-03-07','15507985057','太平洋承保公司','02f619711e3a4138b60e6eb17cf78b2a');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('鄢晨','1999-08-03','13101814742','太平洋承保公司','c4e4160de97d4aad941007ef09c8453a');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('宣枫','1997-03-07','13003495901','太平洋承保公司','d4d9045c3a04432ba69f8eee3175b71d');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('许弘文','2015-08-11','13601700279','太平洋承保公司','1fefb393d97a43288b87fb92a3ee709b');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('冀义国','2009-05-30','13004226782','太平洋承保公司','cd64ade746624a83b7708a3a10bce8fd');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('钮秋璧','1999-07-29','13100264595','太平洋承保公司','88f47616c1564179ba323888a97e3876');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('谈英艺','1992-05-20','15902915536','太平洋承保公司','58afcfaa59dc4785a216e643579e90a3');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('翁炎','2015-11-15','13202385819','太平洋承保公司','24dc347849084cec8ae9d4ee911c9e6d');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('邴辉','2008-06-01','13404955101','太平洋承保公司','49321a0545cc437fb8dc373a9bfbb3e3');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('邱善坚','1993-12-13','13000180736','太平洋承保公司','e0de214f55a74770b5407b97523fa715');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('戎彪','2003-06-17','15603057340','太平洋承保公司','6326a2f8974c4091bc6bb667f8712225');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('良义栋','1997-05-09','15505243000','太平洋承保公司','ddcb280d015a4d9386ef4fd4a0d33465');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('红辰','2014-09-06','15102474541','太平洋承保公司','c927dbc2e1f345efa7a957af9984db96');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('姜之敬','2000-05-04','13204854858','太平洋承保公司','8a858f822f1a4f69a519646aa35c116b');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('况榕若','2015-12-16','15005927073','太平洋承保公司','fc1be2a1bacc40a7bee375f6edbd53cc');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('蓝荣','1990-02-24','15503392971','太平洋承保公司','f791b2c9e2844449b35afe57b1b8c391');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('骆青','2007-03-06','15100854562','太平洋承保公司','82c7729ad5f54cea8abc927d16c5d545');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('寿慧','2008-07-02','13101074816','太平洋承保公司','6bc433dbe0994242b7bf1bcb387581c4');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('滕宁','1993-02-13','13207692266','太平洋承保公司','a01ea11a62a740a8b7b57aae3d6def43');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('方生绍','1996-05-12','13107265233','太平洋承保公司','80c5a5974c4d4bcc86657a95c791212e');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('颜栋俊','2003-09-16','13407720436','太平洋承保公司','3d10e0dde30c47dc8e8d8013c8cef2b8');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('有克','2006-05-17','13008785594','太平洋承保公司','7e2d3e4967d04887a9ea6ac37fa1ef85');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('华秀园','1998-09-29','13504835181','太平洋承保公司','308b46a6927440648536567a6e1d8a5e');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('皇燕红','2001-05-30','15106341892','太平洋承保公司','819c3cd6186a45b2ab30293e989e836a');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('朱月','2010-02-13','15005574458','太平洋承保公司','465eba94f17c4ed4ad609754094d1ce2');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('班雄平','1994-10-12','15503452014','太平洋承保公司','fbb0752db81e4eb8bc26446c01f9357c');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('都蓓妹','1998-04-15','15201665423','太平洋承保公司','039834d13c8047fc95813d94b4aed074');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('平达天','2012-05-18','13208675583','太平洋承保公司','8068ae63a32b41f38af3d77796caaa11');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('阳弘','1994-10-16','13200747890','太平洋承保公司','b2fe877cb98a4884bcb9c498ea0193c7');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('孟哲','2012-05-08','13005382633','太平洋承保公司','282af2ceb9a54d10a06291ea4cc6f7d0');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('通翠','2003-09-23','15805034063','太平洋承保公司','53845fbf9a9f4fc78bea0fb61f3e0ec0');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('仇伊艳','1995-07-07','15104961334','太平洋承保公司','6136cf83176e42b1820c6793c2205dd5');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('卜先政','2010-09-10','13008857591','太平洋承保公司','b02e56300fcc4eadabaa27149cc296a3');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('徐学泽','2012-04-17','15306212042','太平洋承保公司','1c5e28d6118c4555b8b732d87da1f0d6');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('戚兰','2013-01-12','13101914043','太平洋承保公司','f7ace18a23114fb19988c547a4f458ba');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('沃树','1998-07-11','13607052648','太平洋承保公司','cbe404458da6459d8f6bf9e0f84019f8');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('赖竹','1998-05-27','15208479013','太平洋承保公司','8a9670518b0b4046a63ace629db1ccf2');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('段敬雄','2004-10-29','15507553586','太平洋承保公司','bd456f067d144c6daa2a57eec24feb8a');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('房奇心','2000-12-21','13502720733','太平洋承保公司','e7d1ca68ea8041238d2cde13b0ea2954');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('督乐','1995-01-10','15305502046','太平洋承保公司','93a8fa0a26ec4a8a914c307b3d40005f');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('施菲莎','2001-03-21','15103306833','太平洋承保公司','36baf62c3b874459b8cf34fa261d3a3d');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('桓江星','1997-02-12','15300170584','太平洋承保公司','2493a3f3c1794bf2acd56e4c97951335');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('司武','2006-07-30','13506333738','太平洋承保公司','ecb2a9ed9a2e412899fe74ccbf603840');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('暴巧','1997-06-18','13604578886','太平洋承保公司','39147fadcbcd4caa8842993369725a33');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('方珊','2004-02-09','13105533103','太平洋承保公司','2d8d5cf5a60942b69c10712a38b09ce6');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('黄有豪','1993-05-12','13100370486','太平洋承保公司','0063e77771b14b4581cb8a1f016a0e8e');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('家心旭','2010-06-29','15807575344','太平洋承保公司','407a34d0bdd54067b2136fe8a6b6a968');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('何善','2004-01-10','15701464744','太平洋承保公司','7b639121b3204d798153754941ae9a4f');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('常超','2010-08-07','13408292632','太平洋承保公司','366b48c33e6c411ca022a5355bb412ca');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('拔风','2011-09-29','15203140615','太平洋承保公司','c754adf49490430492ec293f94f3db6d');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('裘璧慧','1991-07-18','13101098458','太平洋承保公司','5f78043c09e0463c8d4c9e0e0cfd48ad');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('赵启承','2012-05-20','13608447850','太平洋承保公司','29a2f4aaab1649e68f782761af1fcdcc');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('梅俊航','1990-10-24','15007974282','太平洋承保公司','b9352bec2949453181ac7e460f23e3c9');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('公清友','2015-05-21','15005776035','太平洋承保公司','d763970901e24e0092772df8fde995ac');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('邵翔林','2013-07-13','15706863592','太平洋承保公司','dcc3fb6e7bbf4ed88b42d1abea54b95f');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('高旭','2005-07-24','13100899096','太平洋承保公司','d55322136dce40ec808df192d177a348');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('琴伟','1995-05-09','13400843028','太平洋承保公司','3b7e1c7489134aa99f768c04c89dcbcb');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('葛健','2011-09-23','15703430899','太平洋承保公司','b27cba7925994c8a8624a06e136be2e4');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('微园翠','2007-08-01','15207728476','太平洋承保公司','c61f6515dde84db484705558b857441b');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('经筠秋','2007-03-18','13606011952','太平洋承保公司','98aa7788cd564321a09d4c7c879c122a');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('池翠茗','2004-05-06','13205912862','太平洋承保公司','be24a4314bb145e5922dc58251ad1d34');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('翟国','1997-02-21','15304150649','太平洋承保公司','9747a8afcc774ce194c6e90fb656af7a');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('轩雄','1996-07-12','13804653637','太平洋承保公司','7c767cc36b384432aeca3d0c3d1d0afb');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('荀浩','2002-12-07','15505236122','太平洋承保公司','9f347a6f1a254a0989d1729d5d3449f0');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('贾雄顺','2006-02-20','15608716036','太平洋承保公司','cc046b6693654b36b5f751802dc3fcae');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('袁哲风','1992-07-31','13105446448','太平洋承保公司','d51723b2d5b748f5a9cd6c725f54e666');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('昌美纨','2002-02-05','13000640954','太平洋承保公司','67caf543a5eb4436950428cbc247fa5e');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('贺琼春','2012-08-07','15801967177','太平洋承保公司','302b731663ce4dcbb449e2e720ae3fee');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('马仪毓','2000-04-12','13308666680','太平洋承保公司','b2d1696d03ec46cfb5cf5e9acd180ecc');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('相颖琳','2011-11-30','13602207696','太平洋承保公司','cb551193595648e78d2aa7ee189f6489');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('石河策','2015-07-21','13405022386','太平洋承保公司','5946bff12dbb417fa75da02f8499494d');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('蓝卿眉','2012-04-15','13801002069','太平洋承保公司','753982a83b4744eb99290f90a71a2807');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('尤光言','2006-09-06','15001788548','太平洋承保公司','503ca42b2a6340658245fa3da8ea9247');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('令平','2005-05-04','13402193839','太平洋承保公司','0150850e6f26474e8a44eee1eff4bd78');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('施利','2003-06-03','13600680316','太平洋承保公司','194cf56041fc40d7a8832678ab1e78fd');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('家进','2003-07-18','15107114458','太平洋承保公司','fa7d10e6b1094da68eb5ebf9d7eb3090');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('强萍艺','1991-11-23','15601205625','太平洋承保公司','39c30fa4793e4963b75e635774fdf86f');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('宇致星','2000-08-05','13901395467','太平洋承保公司','56162c2997ef40329f13de85f31bf7fb');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('糜萍','2001-04-19','13203043238','太平洋承保公司','86a2491827c94a3d9d2ea2ad51dfbbe8');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('能思','2000-01-31','13104863970','太平洋承保公司','d66a86765efb4f0ebff0c0ce4576b659');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('延园雪','2002-03-30','15500207873','太平洋承保公司','aeb9e695c9a94b5e8baf9ac7af1783f7');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('伯娅筠','2014-10-18','15805007400','太平洋承保公司','17a43dce5ed746598c25cda1e8d8f96f');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('汲俊','1998-04-03','13602423642','太平洋承保公司','a976912ae3234ec0ae655d6ddf1d6352');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('党永河','2003-10-14','13007675594','太平洋承保公司','07acc4328ad9492385cc6a0a8615945c');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('祝信','1994-01-07','13202896231','太平洋承保公司','55665aacff3b4885b321c90e09a4d814');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('海宏振','2007-05-02','13001528703','太平洋承保公司','ed4b698250644ac6874eca193dd854f6');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('刁浩树','2001-06-15','13007475513','太平洋承保公司','e3bf6c8fdf414469b8159543ce9de253');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('井朗保','2014-11-30','15602531901','太平洋承保公司','9ba29679eb5344e0ad358f0d7d10514d');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('左菲娥','2006-05-18','13504297577','太平洋承保公司','1d5a06f7363e4c7a976749ac90402f6e');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('容固琛','1997-08-23','13406597722','太平洋承保公司','fe3545ae6efa4c84bc2b6ff4328a8f04');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('贡绍平','1993-08-27','15701580275','太平洋承保公司','6a7aae8c1c434411a3935eabe6a910f2');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('时宁固','1990-07-25','15602854585','太平洋承保公司','f16a6e175d5a46d1aa1f41e62e287d10');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('费祥茂','2004-09-15','13708753346','太平洋承保公司','4800d51c26bb4cbe8e61d0b7b24e0c75');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('翟胜和','2005-07-17','13307330408','太平洋承保公司','ec549228e4b74dffb53656c1868b889b');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('戚浩邦','1996-12-25','13602026274','太平洋承保公司','ac520af1426a40d2a13d863b3fdd0bf4');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('狐纨','2011-07-26','13303304224','太平洋承保公司','bfefd59172df43de8e931ccc266cb800');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('茅惠','1992-12-25','15706991811','太平洋承保公司','293135b95d434a89abb367eb2c3c213a');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('童以中','2013-10-01','13302408826','太平洋承保公司','9bb896ed00e948acb36e3e805c4f9b2c');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('薛冠东','2013-11-23','15508415961','太平洋承保公司','24e4f7e994444740b89f813fa87a4113');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('干行浩','2011-12-10','13602067486','太平洋承保公司','e666850a6a6c4db18bccde97ffa65296');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('笪进','1990-09-05','15703552367','太平洋承保公司','818b1aaa6fe7484c80d1bcf7f7ed8069');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('空艺滢','1994-02-28','13101601061','太平洋承保公司','aa47810dde3146c1946d908cc59e5997');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('滕舒凤','2003-01-11','15108544423','太平洋承保公司','6b377ffbe02a45d7a6a5c532de6d3a0f');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('尹霭','1990-12-21','13105743409','太平洋承保公司','189a6d67282f46ef94c833eeb7d91719');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('花萍','2011-05-23','15904710700','太平洋承保公司','b0438f9270cc44cdaa629c3b18367447');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('慕榕','2009-02-17','15505447191','太平洋承保公司','c3dca6844f0943cf80c9f2a21474b713');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('彭瑞','1994-05-14','15106017612','太平洋承保公司','616d3d435f3b4a67a7e723823596cb74');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('劳博','2006-06-21','15303768748','太平洋承保公司','bd1963a1d7164c02822e602f2100d316');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('米富','2009-06-08','13901977045','太平洋承保公司','56eafc01c16446c290995d4e18814f91');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('巫筠','1997-07-07','13703186714','太平洋承保公司','d0c7f540438a479cafd6b55a3ca204ae');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('叔力','1996-07-29','13805031924','太平洋承保公司','e9b1bf9fc5f142d39e686d28d7541665');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('正江顺','2014-12-20','13201803686','太平洋承保公司','26925153e34946f39ffd726b2b6adc9d');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('宋豪','2005-09-14','13403373627','太平洋承保公司','b712b7c6278f491ca3d722644c631b7d');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('暴倩聪','2012-03-16','13203933365','太平洋承保公司','7160b32c4f6d48a5a1c26bd3138946ba');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('郎德光','2013-02-15','13800366386','太平洋承保公司','700b4639e44345f59899cfcb2a0e3801');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('拓蕊芳','2001-04-19','13201026684','太平洋承保公司','18ae77892c4549a4a406999c98453748');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('籍风','2003-09-04','13307631795','太平洋承保公司','0380ce2cab8740f987f718ef0aa9d030');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('包平江','1999-12-20','13507215678','太平洋承保公司','a61ae743a5e74ca59c80eb57cdafb994');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('鞠乐','2000-10-20','15006682619','太平洋承保公司','a71334397b23499fb7e625d3c3b896da');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('牛荔舒','1994-04-20','13306542774','太平洋承保公司','37678ec6826949a7a4a183c0956a6baf');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('郭克树','2005-10-01','15307133581','太平洋承保公司','7e897f474d994d95808696312fe3e06f');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('寇健昌','1995-12-06','13300686683','太平洋承保公司','90402e44b2d24ce09165f6c8c8282719');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('桓武','2009-01-16','13506665311','太平洋承保公司','5921a9ab10aa4030966b486cd8387c97');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('滕斌中','2000-01-29','15108061324','太平洋承保公司','d7b4c156e4bb4006889750cafecbc3f6');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('舌燕妍','2013-05-24','13205517178','太平洋承保公司','26cfd86809b84bbdbbd26356aa40bf9a');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('应瑗','2001-01-21','13503411552','太平洋承保公司','b8d9fd4f03ed41e687de8a5d80a0b4b5');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('黄厚','2001-06-03','15804274622','太平洋承保公司','0e06dab3ec4742edaff6b1e7710c891c');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('南榕','1996-12-05','13903895384','太平洋承保公司','b0689b74def54c80b736ee7ad7c8afb1');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('谈锦','2007-05-07','15200622546','太平洋承保公司','365d1a80de524be292a8985ebc0d1520');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('须光以','2011-12-14','15706038931','太平洋承保公司','33e8be00d1be46f7a0c696183090e65a');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('漆彬风','2008-11-16','15800763278','太平洋承保公司','6233ed56b5df49059b1951cb9051361c');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('鲍光','1996-09-18','15205596412','太平洋承保公司','a7dfd10543604801b71b8491c8fb33dd');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('门婵','2015-07-28','13005250807','太平洋承保公司','2dd4a1a05d6c45ecbd698eff75a608a3');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('车轮栋','2012-05-25','15000807206','太平洋承保公司','7f27d2af9bd442d5a61f138782b060c5');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('终霞芬','2002-08-11','13704451037','太平洋承保公司','a95a93fb59904fd680413ed33898ee24');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('延薇丽','1996-10-08','15907483320','太平洋承保公司','4f144ef26e2441389a9c5a325454c2e5');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('师豪平','1991-06-01','13001040814','太平洋承保公司','2e6ff84bf9424072b80b8a8e5828af5d');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('墨震','1990-06-12','15602742140','太平洋承保公司','f1f9e9b5ae5b4afb81a75522cb2c7522');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('张羽','1992-08-04','13501256331','太平洋承保公司','9ddbe207d0d0435383d331d550ddcf4c');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('佴民','2005-08-15','13700916877','太平洋承保公司','8acd937c620f4c83a82301f9dd15f653');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('靳朋永','2004-12-20','13908154254','太平洋承保公司','45d966242efb4b69af67061f0326a949');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('乌固强','1992-08-25','15202396143','太平洋承保公司','9e149b866b5a4784bf54b5d5d5f4eff8');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('白芸','1994-01-23','15804442085','太平洋承保公司','84f6d646e84d4ea4afab657815417059');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('牧强龙','2002-09-29','15302843864','太平洋承保公司','735437961aa34f6e8dffc4babba1cde3');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('邹旭','2000-02-13','13404515315','太平洋承保公司','fe94625b2fa84652b1f2f44730b8fa6a');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('晁凡琰','1997-11-23','15700890303','太平洋承保公司','8e29893f41b24c6e9916c1a059cc6ccb');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('寿建龙','2008-06-04','15104266365','太平洋承保公司','11f9f038c6904a3a91849044f0c9fd11');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('殷维邦','1996-08-30','13601227674','太平洋承保公司','07ae2f857d91409da1e344cadef5f1a3');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('雍风言','1997-02-25','13805125432','太平洋承保公司','c2a4a099f2f544e1923adcace65fded1');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('明娥宜','1991-04-08','13406915206','太平洋承保公司','6eaf738379744ce8951b2ceb49933d59');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('计厚','1999-04-08','15903482178','太平洋承保公司','9311653ba24b40faab5d140bfc8c379e');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('亢绍伯','2005-02-04','15702701716','太平洋承保公司','a35685ef798d4bdfae99f221a5f103ee');
insert into user (name,birthday,telephone,insurance_company,policy_number) values('盖文','1993-01-04','13103028641','太平洋承保公司','28b5c76075744495afa02347de48c515');

/*
 * medicine data
 * */
insert into medicine(name,sideeffect) values('尼可刹米（可拉明）','大剂量可引起血压升高、心悸、出汗、呕吐、心律失常、震颤及惊厥。');
insert into medicine(name,sideeffect) values('山梗菜碱（洛贝林）','不良反应有恶心、呕吐、腹泻、头痛、眩晕；大剂量可引起心动过速、呼吸抑制、血压下降、甚至惊厥。');
insert into medicine(name,sideeffect) values('多巴胺 ','不良反应有恶心、呕吐、头痛、中枢神经系统兴奋等；大剂量或过量时可使呼吸加速、快速型心律失常');
insert into medicine(name,sideeffect) values('肾上腺素（副肾素）','不良反应有心悸、头痛、血压升高，用量过大或皮下注射时误入血管后，可引起血压突然上升、心律失常，严重可致室颤而致死。');
insert into medicine(name,sideeffect) values('西地兰（去乙酰毛花甙）','不良反应有恶心、呕吐、食欲不振、腹泻，头痛、幻觉、绿黄视，心律失常及房室传导阻滞。');
insert into medicine(name,sideeffect) values('可乐定','钠水排出不畅，嗜睡，头痛，便秘，也可能有心悸、出汗、血压突然升高等现象，通常呈一过性，停药即会消失');
insert into medicine(name,sideeffect) values('利血平(蛇根碱)','引起胃酸分泌增加而致溃疡加重或出血、穿孔。长期服用可出现疲倦、乏力、嗜睡、抑郁甚至精神错乱绝经期妇女服药后可增加乳腺癌的发病率，男性患者服用可引起阳痿。');
insert into medicine(name,sideeffect) values('哌唑嗪','第一次服药是容易导致体位性低血压。主要不良反应是眩晕、疲乏和感觉虚弱。与利尿剂合用疗效更好。');
insert into medicine(name,sideeffect) values('心痛定(硝苯吡啶)','主要副作用表现为头晕、面色潮红、恶心、呕吐等“醉酒样反应”；有人可有心悸、舌根麻木、口干、发汗、食欲不振等不良反应。');
insert into medicine(name,sideeffect) values('开搏通（卡托普利）','副作用表现为引起皮疹、发热现象，还可能导致患者咳嗽。');
insert into medicine(name,sideeffect) values('倍他乐克(美多心安)','药期间可出现胃部不适、眩晕、头痛、疲倦、失眠、恶梦、心动过缓、心功能不全、房室传导阻滞等不良反应。');
insert into medicine(name,sideeffect) values('心得安','是降血压的常用药物。长期服用心得安后骤然停药时，可诱发心绞痛，故长期服药必须逐渐减量后缓慢停药。');

insert into subtitute(m_id,s_id) values(1,2);
insert into subtitute(m_id,s_id) values(1,3);
insert into subtitute(m_id,s_id) values(1,4);
insert into subtitute(m_id,s_id) values(2,5);
insert into subtitute(m_id,s_id) values(2,6);
insert into subtitute(m_id,s_id) values(2,7);
insert into subtitute(m_id,s_id) values(5,8);
insert into subtitute(m_id,s_id) values(8,9);


ALTER TABLE `prescription`.`prescription` 
DROP FOREIGN KEY `FK_jrh5u5cx2ckr8csofr4q4a8x`;
ALTER TABLE `prescription`.`prescription` 
ADD CONSTRAINT `FK_jrh5u5cx2ckr8csofr4q4a8x`
  FOREIGN KEY (`uid`)
  REFERENCES `prescription`.`user` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

  
ALTER TABLE `prescription`.`prescriptiondetail` 
DROP FOREIGN KEY `FK_q2mkptfdkd05pvp3iei20fqua`;
ALTER TABLE `prescription`.`prescriptiondetail` 
ADD CONSTRAINT `FK_q2mkptfdkd05pvp3iei20fqua`
  FOREIGN KEY (`pid`)
  REFERENCES `prescription`.`prescription` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
