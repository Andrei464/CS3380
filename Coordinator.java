import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.Statement;
import java.sql.SQLException;
//import java.sql.PreparedStatement;

//import java.io.FileReader;
//import java.io.IOException;
//import java.io.BufferedReader;
import java.util.Scanner;

public class Coordinator{

    static Connection connection;
    public static void main(String[] args){

            // startup sequence
            Database db = new Database("library.db");
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
			parts = line.split("\\s+");
			if (line.indexOf(" ") > 0)
				arg = line.substring(line.indexOf(" ")).trim();
			if (parts[0].equals("help")){
                System.out.println(
                    "Commands List:" + 
                    "help - help\n" + 
                    "schema - database schema\n" + 
                    "select [projection] from [table]- runs a selection with the given columns\n" + 
                    "" + 
                    "" +
                    "" +
                    "");
            }
			else if (parts[0].equals("schema")) {
                
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

    public Database(String dbFile){
        try {
			String url = "jdbc:sqlite:" + dbFile;
			// create a connection to the database
			connection = DriverManager.getConnection(url);
		} catch (SQLException e) {
			System.out.println("FUCK");
			e.printStackTrace(System.out);
			System.exit(0);
		}
    }
}