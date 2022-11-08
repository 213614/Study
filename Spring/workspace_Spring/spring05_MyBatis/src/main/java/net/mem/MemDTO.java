package net.mem;

public class MemDTO {

	// field
	private int num;
	private String name;
	private int age;
	
	// default constructor
	public MemDTO() {}

	// 테스트용 생성자 함수 
	public MemDTO(int num) {
		this.num = num;
	}
	
	public MemDTO(int num, int age) {
		this.num = num;
		this.age = age;
	}
	
	public MemDTO(String name, int age) {
		this.name = name;
		this.age = age;
	}
	
	public MemDTO(int num, String name, int age) {
		this.num = num;
		this.name = name;
		this.age = age;
	}
	
	// getter·setter
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	} 
	
	// toString 생략
	
}//DTO end
