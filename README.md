# PrescriptionTrackSystem（处方跟踪系统）
##系统要求
处方管理系统的构建是以医师处方为中心，实时录入病人信息，开处方，生成处方，进行数据的统计，简化了传统处方信息处理的过程。本系统的重点是跟踪处方的信息数据并处理数据，处理数据时相关的数据对象有如下有以下：<br>
（1）系统跟踪每位顾客的以下信息：<br>
	顾客姓名、电话号码、出生日期、承保公司、保险号、处方历史记录<br>
（2）每位顾客的服药史将记录下列每次处方信息：<br>
	由药房给出的唯一的处方ID 号、处方开出的药物、开处方的医生姓名和电话号码、处方日期、处方终止日期、有效购药次数、配药“单位”数量（此处的“单位”可能是片、匙和毫升等———见后面关于药品的讨论）、如果有其它替代品，是否可以向顾客提供替代品。<br>
（3）对于药房存货的每种药品，系统应跟踪的如下：<br>
	药品名称，药品“单位”（片、匙和毫升等），哪些其它药品可以作为另一种这种药品的替代品，服用药品可能引起的副作用。<br>
（4）系统所支持的查询功能：<br>
    服药史，即给定顾客的所有处方历史记录—根据顾客的要求提供的报告，某种给定药品的副作用报告，随处方一起提供某种给定药品的可替换药品列表一份给定处方是否还有购药许可：即，是否还可以凭处方购药，以及处方是否已经过期。 <br>
## 内容和目标
(1)用户信息维护，实现用户信息的录入、查询、修改以及删除等功能。<br>
(2)处方信息处理，针对不同的用户记录用户的处方信息，其中处方信息中记录处方开出的药物、开处方的医生姓名和电话号码、处方日期、处方终止日期、有效购药次数、配药“单位”数量（此处的“单位”可能是片、匙和毫升等———见后面关于药品的讨论）、如果有其它替代品，是否可以向顾客提供替代品等信息，并可对该处方进行修改以及删除等操作。<br>
(3)处方历史查询，查询所有的处方信息，或者根据用户的信息模糊查询到该用户的处方信息。<br>
(4)处方药物信息处理，药方根据处方信息处理药物并确认处理。<br>
##关键技术
(1)HTML5 WebSocket API客户端与服务器端进行全双工通讯，WebSocket的出现是基于Web应用的实时性需要而产生的，它允许客户端和服务器在任意时刻互相推送消息。Web Socket是下一代客户端-服务器异步通讯的方法，它本事上任然是一个基于TCP的协议，它使用ws或wss协议，可用于任意的客户端和服务器。为了建立一个 WebSocket 连接，客户端浏览器首先要向服务器发起一个 HTTP 请求，这个请求和通常的 HTTP 请求不同，包含了一些附加头信息，其中附加头信息”Upgrade: WebSocket”(”Upgrade:WebSocket”表示这是一个特殊的 HTTP 请求，请求的目的就是要将客户端和服务器端的通讯协议从 HTTP 协议升级到 WebSocket 协议。)表明这是一个申请协议升级的 HTTP 请求，服务器端解析这些附加的头信息然后产生应答信息返回给客户端，客户端和服务器端的 WebSocket 连接就建立起来了，双方就可以通过这个连接通道自由的传递信息，并且这个连接会持续存在直到客户端或者服务器端的某一方主动的关闭连接。它的通讯方式如下：图客户端和服务器websocket通讯。<br>
![](https://github.com/silence940109/PrescriptionTrackSystem/blob/master/systemimages/websocket.jpg)<br>
(2)HighChats一套由纯Javascript写的表现层框架,它提供曲线、面积、柱形图、条形图、饼图、散点图、区域范围图、气泡、漏斗等等一系列的图形表现形式。HighChars不需要像Flash和Java那样需要插件才可以运行，而且运行速度快,它是轻量级的JavaScript脚本，它使用的是json数据格式，数据传输更加方便，而且它的数据是在客户端解析的，减轻了服务器的压力，所以它比JFreeChart更方便(JFreeChart是JAVA平台上的一个开放的图表绘制类库。它完全使用JAVA语言编写在我看来JFreeChart有点笨重了，而且它生成的图形也比HighChart少，并且好像是收费的)。另外HighCharts还有很好的兼容性，能够完美支持当前大多数浏览器。<br>
![](https://github.com/silence940109/PrescriptionTrackSystem/blob/master/systemimages/highchart.jpg)<br>
(3)Spring Data JPA提供了一整套数据访问层(DAO)的解决方案，致力于减少数据访问层的开发量，并支持云服务的开源框架。Spring Data 作为SpringSource的其中一个父项目， 旨在统一和简化对各类型持久化存储， 而不拘泥于是关系型数据库还是NoSQL 数据存储。无论是哪种持久化存储， 数据访问对象（或称作为DAO，即Data Access Objects）通常都会提供对单一域对象的CRUD （创建、读取、更新、删除）操作、查询方法、排序和分页方法等。Spring Data则提供了基于这些层面的统一接口（Repository、CrudRepository、PagingAndSortingRepository、JpaRepository）以及对持久化存储的实现。JPA（Java Persistence API，Java持久化API）是sun提出的一个对象持久化规范，各JavaEE应用服务器自主选择实现，JPA的底层实现是一些流行的开源ORM(对象关系映射)框架（如Hibernate、OpenJPA、TopLink、Ibatis等等），因此JPA其实也就是java实体对象和关系型数据库建立起映射关系，通过面向对象编程的思想操作关系型数据库的规范。JPA，定义了对象-关系映射以及实体对象持久化的标准接口。如下图：图2JPA在 应用程序中的位置：
![](https://github.com/silence940109/PrescriptionTrackSystem/blob/master/systemimages/JPA.jpg)<br>
Spring Data Jpa是Spring Data对JPA提供的一套解决方案。Spring Data Jpa实现了大部分的持久层的逻辑代码，你需要做的只是声明持久层的接口，其他的都交给Spring Data Jpa完成。Spring Data Jpa中Repository是一个空接口，CrudRepository： 继承Repository，实现了一组CRUD相关的方法 ，PagingAndSortingRepository： 继承CrudRepository，实现了一组分页排序相关的方法 ，JpaRepository：继承PagingAndSortingRepository，实现一组JPA规范相关的方法 Spring Data Jpa提供的接口如下图4-4-3Spring Data Jpa提供的接口图：<br>
![](https://github.com/silence940109/PrescriptionTrackSystem/blob/master/systemimages/Spring Data Jpa.jpg)<br>
(4)Spring MVC, Spring Web MVC是一种基于Java的实现了Web MVC设计模式的请求驱动类型的轻量级Web框架，即使用了MVC架构模式的思想，将web层进行职责解耦，基于请求驱动指的就是使用请求-响应模型，框架的目的就是帮助我们简化开发，Spring Web MVC也是要简化我们日常Web开发的。它的请求处理流程图如下：
![](https://github.com/silence940109/PrescriptionTrackSystem/blob/master/systemimages/Spring MVC.jpg)<br>
前端控制器首先接收到用户的请求，前端控制器根据接收的请求信息把请求委托给页面控制器来处理。处理器接收请求后调用相应的业务对象处理请求，如果有数据库操作会向数据库请求数据，并返回一个模型视图（一般是ModelAndView），返回的模型经过视图解析器把，模型数据解析到页面中并返回给客户端。Spring MVC充分对模型、视图、控制器进行充分的解耦，并利用Spring IOC的功能更加方便管理。<br>
(5)REST风格URL，REST架构风格是全新的针对Web应用的开发风格，是当今世界最成功的互联网超媒体分布式系统架构，它使得人们真正理解了Http协议本来面貌。<br>随着REST架构成为主流技术，一种全新的互联网网络应用开发的思维方式开始流行。
REST是基于Http协议的，任何对资源的操作行为都是通过Http协议来实现。以往的Web开发大多数用的都是Http协议中的GET和POST方法，对其他方法很少使用，这实际上是因为对Http协议认识片面的理解造成的。Http不仅仅是一个简单的运载数据的协议，而是一个具有丰富内涵的网络软件的协议。他不仅仅能对互联网资源进行唯一定位，而且还能告诉我们如何对该资源进行操作。Http把对一个资源的操作限制在4个方法以内：GET,POST,PUT和DELETE，这正是对资源CRUD操作的实现。由于资源和URI是一一对应的，执行这些操作的时候URI是没有变化的，这和以往的Web开发有很大的区别。正由于这一点，极大的简化了Web开发，也使得URI可以被设计成更为直观的反映资源的结构，这种URI的设计被称作RESTful的URI。基于REST URL风格的请求方式如下：
![](https://github.com/silence940109/PrescriptionTrackSystem/blob/master/systemimages/restful.jpg)<br>

##数据库设计
![](https://github.com/silence940109/PrescriptionTrackSystem/blob/master/systemimages/uml.jpg)<br>
![](https://github.com/silence940109/PrescriptionTrackSystem/blob/master/systemimages/user.jpg)<br>
![](https://github.com/silence940109/PrescriptionTrackSystem/blob/master/systemimages/department.jpg)<br>
![](https://github.com/silence940109/PrescriptionTrackSystem/blob/master/systemimages/position.jpg)<br>
![](https://github.com/silence940109/PrescriptionTrackSystem/blob/master/systemimages/doctor.jpg)<br>
![](https://github.com/silence940109/PrescriptionTrackSystem/blob/master/systemimages/prescription.jpg)<br>
![](https://github.com/silence940109/PrescriptionTrackSystem/blob/master/systemimages/prescriptiondetail.jpg)<br>
![](https://github.com/silence940109/PrescriptionTrackSystem/blob/master/systemimages/medicine.jpg)<br>
![](https://github.com/silence940109/PrescriptionTrackSystem/blob/master/systemimages/subtitute.jpg)<br>
##基于注解的类的设计
@Table(name="department")<br>
@Entity<br>
public class Department {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Column(length=32,nullable=false)	
	//部门的名字
	private String name;
	//该部门下的医生
	@OneToMany(fetch=FetchType.LAZY,mappedBy="department",cascade=CascadeType.ALL)
	private Set<Doctor> doctors = new HashSet<Doctor>();
	/*省略setter和getter*/
}
<br>
@Entity<br>
@Table(name="doctor")<br>
public class Doctor {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	//医师姓名
	@Column(length=32,nullable=false)
	private String name;
	//医师电话
	@Column(length=32,nullable=false)
	private String telephone;
	//登录密码
	@Column(length=32,nullable=false)
	private String password;
	//医师所属的部门
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=Department.class,optional=false)
	@JoinColumn(name="did")
	private Department department;
	//医师的职位
	@ManyToOne(fetch=FetchType.EAGER,targetEntity=Position.class,optional=false)
	@JoinColumn(name="pid")
	private Position position;	
	//该医生的处方
	@OneToMany(fetch=FetchType.LAZY,mappedBy="doctor",cascade=CascadeType.ALL)
	private Set<Prescription> prescriptions;
	/*省略setter和getter*/
}
<br>
@Entity
@Table(name="medicine")<br>
public class Medicine {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Column(length=64,nullable=false)
	private String name;
	@Column(length=128)
	private String sideeffect;
	@OneToMany(fetch=FetchType.LAZY,mappedBy="medicine",cascade=CascadeType.ALL,targetEntity=PrescriptionDetail.class)
	private Set<PrescriptionDetail> prescriptionDetails = new HashSet<PrescriptionDetail>();	
	@OneToMany(cascade=CascadeType.ALL,fetch=FetchType.LAZY)
	//表关联的方式来映射一对多或者多对多的关系时，要使用@JoinTable这个标记
	//name属性为连接两个表的表名称
	//joinColumns属性表示，在保存关系中的表中，所保存关联关系的外键的字段。并配合@JoinColumn标记使用。
	//inverseJoinColumns属性与joinColumns属性类似，它保存的是保存关系的另一个外键字段
	@JoinTable(name="subtitute",joinColumns={@JoinColumn(name="m_id")},inverseJoinColumns
	={@JoinColumn(name="s_id")})
	private Set<Medicine> substitutes = new HashSet<Medicine>();
}
<br>
@Table(name="position")<br>
@Entity<br>
public class Position {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Column(length=32,nullable=false)
	//职位的名称
	private String name;
	//该职位下的医生
	@OneToMany(fetch=FetchType.LAZY,mappedBy="position",cascade=CascadeType.ALL)
	@OrderBy(value="id ASC")
	private Set<Doctor> doctors = new HashSet<Doctor>();
}
<br>
@Entity<br>
@Table(name="prescription")<br>
public class Prescription {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@DateTimeFormat(pattern="MM/dd/yyyy")
	@Temporal(TemporalType.DATE)
	//处方开始日期
	private Date begindate;
	@DateTimeFormat(pattern="MM/dd/yyyy")
	@Temporal(TemporalType.DATE)
	//处方终止日期
	private Date enddate;
	//有效抓要次数
	@Column(length=4)
	private int crawlagainst;
	//处方所属用户
	@ManyToOne(fetch=FetchType.LAZY,targetEntity=User.class,optional=false)
	@JoinColumn(name="uid")
	private User user;
	//处方所属医生
	@ManyToOne(fetch=FetchType.LAZY,targetEntity=Doctor.class,optional=false)
	@JoinColumn(name="did")
	private Doctor doctor;
	
	@OneToMany(fetch=FetchType.EAGER,mappedBy="prescription",cascade=CascadeType.ALL)
	private Set<PrescriptionDetail> prescriptionDetails = new HashSet<PrescriptionDetail>();
}
<br>
@Entity<br>
@Table(name="prescriptiondetail")<br>
public class PrescriptionDetail {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	//该药的数量
	@Column(length=4)
	private int count;
	//该药的单位
	@Column(length=16)
	private String unit;
	@Column(length=128)
	private String takemethod;
	@Column(length=16)
	private String canuse;
	@ManyToOne(fetch=FetchType.LAZY,targetEntity=Prescription.class,optional=false)
	@JoinColumn(name="pid")
	private Prescription prescription;
	@ManyToOne(fetch=FetchType.LAZY,targetEntity=Medicine.class,optional=false)
	@JoinColumn(name="mid")
	private Medicine medicine;
}
<br>
@Entity<br>
@Table(name="user")<br>
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	// 用户id
	private int id;
	// 用户姓名
	@Column(length=32)
	private String name;
	// 用户电话
	private String telephone;
	// 用户出生日期
	@DateTimeFormat(pattern="MM/dd/yyyy")
	@Temporal(TemporalType.DATE)
	private Date birthday;
	// 承保公司
	@Column(length=32)
	private String insuranceCompany;
	// 保单号
	@Column(length=32)
	private String policyNumber;

	/*
	 * CascadeType.REFRESH当多个用户同时操作一个实体，为了用户取到的数据是实时的，在用shiite中的数据之前就可以调用一下refresh()方法
	 * CascadeType.REMOVE级联删除，当调用remove()方法删除实体时会先级联删除相关数据
	 * CascadeType.MERGE级联更新
	 * CascadeType.ALL包含以上所有的属性
	 */
	@OneToMany(fetch=FetchType.LAZY,mappedBy="user",cascade=CascadeType.ALL)
	private Set<Prescription> prescriptions;
}