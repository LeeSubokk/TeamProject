package com.web.zoomIn;

import java.sql.Connection;
import java.sql.DriverManager;
import org.junit.Test;

public class DB_Test {
	@Test
	public void test() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL

		Connection con = DriverManager.getConnection("jdbc:mysql://13.124.84.56/3s25", "lsu878", "tmddnr12"); // MySQL
		System.out.println(con);
	}
}