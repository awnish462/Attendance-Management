package com.Entity;

import java.time.LocalDate;


import javax.persistence.*;




@Entity
@Table(name="dateAttendance")
public class DateAttendance {
	
	private int id;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int user_id;
	private boolean present;
	private boolean absent;
	private LocalDate attendanceDate;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public boolean isPresent() {
		return present;
	}
	public void setPresent(boolean present) {
		this.present = present;
	}
	public boolean isAbsent() {
		return absent;
	}
	public void setAbsent(boolean absent) {
		this.absent = absent;
	}
	public LocalDate getAttendanceDate() {
		return attendanceDate;
	}
	public void setAttendanceDate(LocalDate attendanceDate) {
		this.attendanceDate = attendanceDate;
	}
	public DateAttendance( int user_id, boolean present, boolean absent, LocalDate attendanceDate) {
		super();
		this.user_id = user_id;
		this.present = present;
		this.absent = absent;
		this.attendanceDate = attendanceDate;
	}
	public DateAttendance() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
