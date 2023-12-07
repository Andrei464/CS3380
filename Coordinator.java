import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.io.FileReader;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Coordinator{

    static Connection connection;
    public static void main(String[] args){

            // startup sequence
            Database db = new Database();
            runConsole(db);
            System.out.println("Exiting...");
    }

    public static void runConsole(Database db) {

		Scanner console = new Scanner(System.in);
		System.out.print("Welcome! Type h for help. ");
		System.out.print("db > ");
		String line = console.nextLine();
		String[] parts;
		String arg = "";

		while (line != null && !line.equals("q")) {
			//airports by country
			//all airports
			//airlines by destination
			//large/medium/small airports by country
			//waypoints for a given route
			//shortest route????
			parts = line.split("\\s+");
			if (line.indexOf(" ") > 0)
				arg = line.substring(line.indexOf(" ")).trim();
			if (parts[0].equals("help")){
                System.out.println(
                    "Commands List:\n" + 
                    "help - help\n" + 
                    "schema - database schema\n" +
                    "" + 
                    "" + 
                    "" +
                    "" +
                    "");
            }
			else if (parts[0].equals("repupulate")) {
                db.repopulate();
			}
			else{
				System.out.println("Type help for all commands, or pray <3");
            }

			System.out.print("db > ");
			line = console.nextLine();
		}

		console.close();
	}

}

class Database{

    private Connection connection;  

    public Database(){
        try {
			// create a connection to the database
			connection = DriverManager.getConnection("jdbc:sqlserver://uranium.cs.umanitoba.ca;user=sholokh1;password=7941961;trustServerCertificate=true");
		} catch (SQLException e) {
			System.out.println("Couldn't Connect to Database");
			e.printStackTrace(System.out);
			System.exit(0);
		}
    }

	public void search(){
		try{
			PreparedStatement prepedStatement;
			String query = "SELECT * FROM AIRLINES";
			prepedStatement = connection.prepareStatement(query);
			ResultSet result = prepedStatement.executeQuery();
			if(result.next()){
				System.out.println("Data:");
				do{
            		String name = result.getString("name");
            		System.out.println(name);
        		}while (result.next());
			}
			else{
				System.out.println("[Nothing Found]");
			}
		}catch (SQLException e) {
        		e.printStackTrace();
    	}
	}

	public void dropTables(){
		try{
			PreparedStatement prepedStatement;
			String query = "";
			prepedStatement = connection.prepareStatement(query);
			ResultSet result = prepedStatement.executeQuery();
			if(result.next()){
				System.out.println("Data:");
				do{
            		String name = result.getString("name");
            		System.out.println(name);
        		}while (result.next());
			}
			else{
				System.out.println("[Nothing Found]");
			}
		}catch (SQLException e) {
        		e.printStackTrace();
    	}
	}

	public void repopulate(){
		try{
			test();
			
			Statement statement = readIn("database.sql");
			
			int count[] = statement.executeBatch();
			for(int i = 0; i < count.length; i++){
				if(count[i] < 0){
					//an error occured and we need to rollback
					connection.rollback();
				}
			}
			test();
		}catch (SQLException e) {
        	e.printStackTrace();
		}
	}

	public void test(){
		try{
			PreparedStatement prepedStatement;
			String query = "SELECT * FROM airlines";
			prepedStatement = connection.prepareStatement(query);
			ResultSet result = prepedStatement.executeQuery();
			if(result.next()){
				System.out.println("Data:");
				do{
            		String name = result.getString("name");
            		System.out.println(name);
        		}while (result.next());
			}
			else{
				System.out.println("[Nothing Found]");
			}
		}catch (SQLException e) {
        		e.printStackTrace();
    	}
	}

	public Statement readIn(String fileName){
		try{
			Statement statement = connection.createStatement();
			File database = new File(fileName);
			Scanner scanner = new Scanner(database);
			//Need to make the statement not autocommit
			connection.setAutoCommit(false);
			while (scanner.hasNextLine()){
				statement.addBatch(scanner.nextLine());
			}
			scanner.close();
			return statement;
    	}catch (FileNotFoundException e) {
			System.out.println("File Not Found");
        	e.printStackTrace();
			return null;
    	}catch (SQLException e) {
        	e.printStackTrace();
			return null;
    	}
	}
}