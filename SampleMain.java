import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class SampleMain {
	
	public static void main(String[]args) throws SQLException {
		Connection conn = null;
		try {
		    conn =
		       DriverManager.getConnection("jdbc:mysql://localhost/wrpracti_bookinfo?" +
		                                   "user=root");
		    
		    Statement statement = conn.createStatement();
		    statement.executeUpdate("truncate regions");
		    statement = conn.createStatement();
		    statement.addBatch("INSERT INTO regions values(1, \"Europe\")");
		    statement.addBatch("INSERT INTO regions values(2, \"Americas\")");
		    statement.addBatch("INSERT INTO regions values(3, \"Asia\")");
		    statement.addBatch("INSERT INTO regions values(4, \"Middle East and Africa\")");
		    statement.executeBatch();
		    
		    statement = conn.createStatement();
		    statement.executeUpdate("truncate countries");
		    statement.addBatch("INSERT INTO country values(1, 2, \"Argentina\", \"AR\")");
		    statement.addBatch("INSERT INTO country values(2, 3, \"Australia\", \"AU\")");
		    statement.addBatch("INSERT INTO country values(3, 1, \"Belgium\", \"BE\")");
		    statement.addBatch("INSERT INTO country values(4, 4, \"Egypt\", \"EG\")");
		    statement.addBatch("INSERT INTO country values(5, 3, \"HongKong\", \"HK\")");
		    
		    statement = conn.createStatement();
		    statement.executeUpdate("truncate locations");
		    statement = conn.createStatement();
		    statement.addBatch("INSERT INTO locations values(1, 1, \"Sample Street 1\", \"1111\", \"Sample city1\", \"Sample province1\")");
		    statement.addBatch("INSERT INTO locations values(2, 2, \"Sample Street 1\", \"2222\", \"Sample city2\", \"Sample province2\")");
		    statement.addBatch("INSERT INTO locations values(3, 3, \"Sample Street 1\", \"3333\", \"Sample city3\", \"Sample province3\")");
		    statement.addBatch("INSERT INTO locations values(4, 4, \"Sample Street 1\", \"4444\", \"Sample city4\", \"Sample province4\")");
		    statement.addBatch("INSERT INTO locations values(5, 5, \"Sample Street 1\", \"5555\", \"Sample city5\", \"Sample province5\")");
		    statement.executeBatch();
		    
		    statement = conn.createStatement();
		    statement.executeUpdate("truncate jobs");
		    statement = conn.createStatement();
		    statement.addBatch("INSERT INTO jobs values(1, \"Sample jobs 1\", 100.00, 200.00)");
		    statement.addBatch("INSERT INTO jobs values(2, \"Sample jobs 2\", 200.00, 300.00)");
		    statement.addBatch("INSERT INTO jobs values(3, \"Sample jobs 3\", 300.00, 400.00)");
		    statement.addBatch("INSERT INTO jobs values(4, \"Sample jobs 4\", 400.00, 500.00)");
		    statement.addBatch("INSERT INTO jobs values(5, \"Sample jobs 5\", 500.00, 600.00)");
		    statement.executeBatch();
		    
		    statement = conn.createStatement();
		    statement.executeUpdate("truncate departments");
		    statement = conn.createStatement();
		    statement.addBatch("INSERT INTO departments values(1, 1, \"Sample departments 1\")");
		    statement.addBatch("INSERT INTO departments values(2, 2, \"Sample departments 2\")");
		    statement.addBatch("INSERT INTO departments values(3, 3, \"Sample departments 3\")");
		    statement.addBatch("INSERT INTO departments values(4, 4, \"Sample departments 4\")");
		    statement.addBatch("INSERT INTO departments values(5, 5, \"Sample departments 5\")");
		    statement.executeBatch();
		    
		    int id = 1;
		    
		    statement = conn.createStatement();
		    statement.executeUpdate("truncate employees");
		    statement = conn.createStatement();
		    statement.executeUpdate("truncate job_history");
		    
		    for(int x=1;x<=10000;x++) {
		    	
			    statement = conn.createStatement();
			    statement.executeUpdate("INSERT INTO employees values("+x+", \"firstName"+x+"\", \"middleName"+x+"\", \"sampleEmail"+x+"@sample.com\", \""+x+"\")");
			    statement = conn.createStatement();
			    statement.executeUpdate("INSERT INTO job_history values("+x+", "+id+", "+x+","+id+", NOW(), NOW(), NOW(), "+x+", "+id+", 1)");

		    	
		    	id++;
		    	if(id>5) {
		    		id = 1;
		    	}
		    }


		} catch (SQLException ex) {
		    // handle any errors
		    System.out.println("SQLException: " + ex.getMessage());
		    System.out.println("SQLState: " + ex.getSQLState());
		    System.out.println("VendorError: " + ex.getErrorCode());
		}finally {
			conn.close();
		}
	}

}
