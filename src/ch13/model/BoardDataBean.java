package ch13.model;

import java.sql.Timestamp;

//MVC(Model(외부연계-DB연동,Filesystem연동,영상처리) / view / controller(servlet파일로 구성되고 화면전환 - forward())
//Model
//DB Connection - pool
//DB Access - DAO - CRUD (insert, select, update, delete)
//내부연계
//view(jsp)로 전달하는법
//VO(Value Object) = DTO(Data Transfer Object)

//void main() {
//	request_Generate_Invoice(calulatePayroll('201806R001'), 각급여결과, 전표번호, 급여일자, 식발자);
//}
//
//request_Generate_Invoice(int calPayroll, String wjsvyqjsgh, String rmqdudlfwk, String tlrqufwk){
//	InvoiceDTO returnInvoiceDTO = requestInvoice();
//	return returnInvoiceDTO;
//}





public class BoardDataBean {
	private int num;
	private String writer;
	private String subject;
	private String email;
	private String content;
	private String passwd;
	private Timestamp reg_date;
	private int readcount;
	private String ip;
	private int ref;
	private int re_step;
	private int re_level;
	private String filename;

	/*
	 * private String name; private String id; private String tel;
	 */
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	/*
	 * public String getName() { return name; } public void setName(String name) {
	 * this.name = name; } public String getId() { return id; } public void
	 * setId(String id) { this.id = id; } public String getTel() { return tel; }
	 * public void setTel(String tel) { this.tel = tel; }
	 */
	
	
}
