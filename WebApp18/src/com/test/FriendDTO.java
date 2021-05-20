/*=====================
	FriendDTO.java
=====================*/

package com.test;

public class FriendDTO
{
	private String userName;	//-- 이름
	private String userAge;		//-- 나이
	private String gender;		//-- 성별
	private String[] boys;		//-- 이상형
	
	// getter / setter 
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public String getUserAge()
	{
		return userAge;
	}
	public void setUserAge(String userAge)
	{
		this.userAge = userAge;
	}
	public String getGender()
	{
		return gender;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public String[] getBoys()
	{
		return boys;
	}
	public void setBoys(String[] boys)
	{
		this.boys = boys;
	}
	
	
}
