import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Coordinator {

	static Connection connection;

	public static void main(String[] args) {

		// startup sequence
		Database db = new Database(args);
		runConsole(db);
		System.out.println("Exiting...");
	}

	public static void runConsole(Database db) {

		Scanner console = new Scanner(System.in);
		System.out.print("Welcome! Type h for help.\n");
		System.out.print("db > ");
		String line = console.nextLine();
		String[] parts;
		String arg = "";

		while (line != null && !line.equals("q")) {
			// airports by country
			// all airports
			// airlines by destination
			// large/medium/small airports by country
			// which airplaines are used by which airlines which airline uses what airplanes
			// shortest route????

			// write up

			// interface
			parts = line.split("\\s+");
			if (line.indexOf(" ") > 0)
				arg = line.substring(line.indexOf(" ")).trim();
			if (parts[0].equals("help")) {
				System.out.println(
						"Commands List:\n" +
								"help - help\n" +
								"schema - database schema\n" +
								"" +
								"" +
								"" +
								"" +
								"");
			} else if (parts[0].equals("repopulate")) {
				System.out.println("Z");
				db.runSQLStatements("dropAll.sql");
				System.out.println("A");
				db.runSQLStatements("Queries/insert_continents.sql");
				System.out.println("B");
				db.runSQLStatements("Queries/insert_countries.sql");
				System.out.println("C");
				db.runSQLStatements("Queries/insert_cities.sql");
				System.out.println("D");
				db.runSQLStatements("Queries/insert_airlines.sql");
				System.out.println("E");
				db.runSQLStatements("Queries/insert_airplanes.sql");
				System.out.println("F");
			} else if (parts[0].equals("drop")) {
				db.drop();
			} else {
				System.out.println("Type help for all commands, or pray <3");
			}

			System.out.print("db > ");
			line = console.nextLine();
		}

		console.close();
	}

}

class Database {

	private Connection connection;

	public Database(String args[]) {
		try {
			// create a connection to the database
			connection = DriverManager.getConnection(
					"jdbc:sqlserver://uranium.cs.umanitoba.ca;" +
							"user=" + args[0]  + ";" +
							"password=" + args[1]  + ";" +
							"trustServerCertificate=true");
		} catch (SQLException e) {
			System.out.println("Couldn't Connect to Database");
			e.printStackTrace(System.out);
			System.exit(0);
		}
	}

	public void drop() {
		runSQLStatements("dropAll.sql");
	}

	public void runSQLStatements(String pathname) {
		try {
			Statement statement = connection.createStatement();
			File database = new File(pathname);
			Scanner scanner = new Scanner(database);
			// Need to make the statement not autocommit
			String line = "";
			connection.setAutoCommit(false);
			while (scanner.hasNextLine()) {
				line = scanner.nextLine();
				System.out.println(line);
				if (line != "" && line != null) {
					statement.executeUpdate(line);
				}
			}
			scanner.close();
			connection.commit();
			connection.setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			System.out.println("File Not Found");
		}
	}

	public void runSQL(String file) {
		try {
			Statement statement = connection.createStatement();
			File database = new File(file);
			Scanner scanner = new Scanner(database);
			// Need to make the statement not autocommit
			String line = "";
			while (scanner.hasNextLine()) {
				line = scanner.nextLine();
				if (line != "" && line != null) {
					statement.addBatch(line);
				}
			}
			scanner.close();
			connection.setAutoCommit(false);
			int count[] = statement.executeBatch();
			boolean rollBack = false;
			for (int i = 0; i < count.length; i++) {
				if (count[i] == -1) {
					// an error occured and we need to rollback
					rollBack = true;
					break;
				}
			}
			if (rollBack) {
				System.out.println("ROLL BACK");
				connection.rollback();
			} else {
				connection.commit();
			}

			connection.setAutoCommit(true);
		} catch (SQLException e) {
			System.out.println("FAILURE");
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			System.out.println("File Not Found");
		}
	}

	public void test() {
		try {
			PreparedStatement prepedStatement;
			String query = "SELECT * FROM airlines";
			prepedStatement = connection.prepareStatement(query);
			ResultSet result = prepedStatement.executeQuery();
			if (result.next()) {
				System.out.println("Data:");
				do {
					String name = result.getString("name");
					System.out.println(name);
				} while (result.next());
			} else {
				System.out.println("[Nothing Found]");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}