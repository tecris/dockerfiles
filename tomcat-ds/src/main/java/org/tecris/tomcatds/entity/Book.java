package org.tecris.tomcatds.entity;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Book
	implements Serializable
{

	private String bookName;
	private String fullName;
	private int age;

	public Book ()
	{

	}

	public Book (
		String bookName,
		String fullName,
		int age)
	{
		super ();
		this.bookName = bookName;
		this.fullName = fullName;
		this.age = age;
	}

	public String getBookName ()
	{
		return bookName;
	}

	public void setBookName (
		String bookName)
	{
		this.bookName = bookName;
	}

	public String getFullName ()
	{
		return fullName;
	}

	public void setFullName (
		String fullName)
	{
		this.fullName = fullName;
	}

	public int getAge ()
	{
		return age;
	}

	public void setAge (
		int age)
	{
		this.age = age;
	}

}
