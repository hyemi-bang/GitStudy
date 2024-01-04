package chap08.dto;

import java.util.Date;

public class EmployeeDTO2 {

	private Integer employee_id;
	private String first_name;
	private String last_name;
	private Double salary;
	private Date hire_date;
	private String department_name;

	public EmployeeDTO2(Integer employee_id, String first_name, String last_name, Double salary, Date hire_date,
			String department_name) {
		super();
		this.employee_id = employee_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.salary = salary;
		this.hire_date = hire_date;
		this.department_name = department_name;
	}
	
	public Integer getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(Integer employee_id) {
		this.employee_id = employee_id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public Double getSalary() {
		return salary;
	}
	public void setSalary(Double salary) {
		this.salary = salary;
	}
	public Date getHire_date() {
		return hire_date;
	}
	public void setHire_date(Date hire_date) {
		this.hire_date = hire_date;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}

	@Override
	public String toString() {
		return "EmployeeDTO2 [employee_id=" + employee_id + ", first_name=" + first_name + ", last_name=" + last_name
				+ ", salary=" + salary + ", hire_date=" + hire_date + ", department_name=" + department_name + "]";
	}
	
	
}
