package org.tecris.tomcatds;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.tecris.tomcatds.entity.Book;

@Path ("/book")
public class HelloWorldService
{

	@GET
	@Path ("/{param}")
	@Produces (MediaType.APPLICATION_JSON)
	public Response getMsg (
		@PathParam ("param") String msg)
	{

		String output = "Jersey say : " + msg;

		output = getData ().toString ();

		return Response.ok (getData ().get (0)).status (200).build ();
	}

	private List<Book> getData ()
	{
		Context context = null;
		DataSource datasource = null;
		Connection connect = null;
		Statement statement = null;

		List<Book> bookList = new ArrayList<> ();

		try
		{
			// Get the context and create a connection
			context = new InitialContext ();
			datasource = (DataSource) context.lookup ("java:/comp/env/jdbc/MySqlDS");
			connect = datasource.getConnection ();

			// Create the statement to be used to get the results.
			statement = connect.createStatement ();
			String query = "SELECT * FROM book";

			// Execute the query and get the result set.
			ResultSet resultSet = statement.executeQuery (query);
			while (resultSet.next ())
			{
				bookList.add (new Book (resultSet.getString ("name"), resultSet.getString ("author"), resultSet
					.getInt ("year")));
			}
		} catch (Exception e)
		{
			e.printStackTrace ();
		} finally
		{
			// Close the connection and release the resources used.
			try
			{
				statement.close ();
			} catch (Exception e)
			{
				e.printStackTrace ();
			}
		}
		return bookList;
	}
}
