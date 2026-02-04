package com.java.www;

public class Stuscore {
	{
		count++;
		no = count;
	}
	
	public Stuscore(){}
	
	public Stuscore(String name, int kor, int eng, int math){
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		calTotal(kor, eng, math);
		calAvg(kor, eng, math);
	}
	
	public Stuscore(int no, String name, int kor, int eng, int math, int total, double avg) {
		this.no = no;
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		this.total = total;
		this.avg = avg;
	}
	
	static int count;
	private int no;
	private String name;
	private int kor;
	private int eng;
	private int math;
	private int total;
	private double avg;
	
	void calTotal() {
		this.total = this.kor + this.eng + this.math;
		calAvg();
	}
	
	void calTotal(int kor, int eng, int math) {
		this.total = kor + eng + math;
	}
	
	void calAvg() {
		this.avg = this.total / (double)3.0;
	}
	
	void calAvg(int total) {
		this.avg = total / (double)3.0;
	}
	
	void calAvg(int kor, int eng, int math) {
		this.avg = (kor + eng + math) / (double)3.0;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
		calTotal();
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
		calTotal();
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
		calTotal();
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}
}
