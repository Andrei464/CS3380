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
			// interface
			parts = line.split("\\s+");
			if (line.indexOf(" ") > 0)
				arg = line.substring(line.indexOf(" ")).trim();
			if (parts[0].equals("help")) {
				System.out.println(
					"Commands List:\n" +
					"help - help\n" +
					"drop - drops all tables\n" +
					"repopulate - repopulates the entire database\n" +
					"airports - " +
					"airlineAirports - " +
					"specialDest - " +
					"largeAirports - " +
					"airplanesAirlines - " +
					"popularCities - " +
					"unpopularCities - " +
					"popularAircraft - "
				);
			} else if (parts[0].equals("repopulate")) {
				db.runSQLStatements("dropAll.sql");
				System.out.println("A");
				db.runManySQL("Queries/insert_continents.sql");
				System.out.println("B");
				db.runManySQL("Queries/insert_countries.sql");
				System.out.println("C");
				db.runManySQL("Queries/insert_cities.sql");
				System.out.println("D");
				db.runManySQL("Queries/insert_airlines.sql");
				System.out.println("E");
				db.runManySQL("Queries/insert_airplanes.sql");
				System.out.println("F");
				db.runManySQL("Queries/insert_flightroutes.sql");
				System.out.println("DONE");
			} else if (parts[0].equals("drop")) {
				db.runSQLStatements("dropAll.sql");
			} else if (parts[0].equals("airports")) {
				db.airportsCountry();
			} else if (parts[0].equals("airlineAirports")) {
				db.airportsForAirline();
			}else if (parts[0].equals("specialDest")) {
				db.specialDestination();
			}else if (parts[0].equals("largeAirports")) {
				db.largeAirports();
			}else if (parts[0].equals("airplanesAirlines")) {
				db.airplanesForAirlines();
			}else if (parts[0].equals("popularCities")) {
				db.popularCities();
			}else if (parts[0].equals("unpopularCities")) {
				db.unpopularCities();
			}else if (parts[0].equals("popularAircraft")) {
				db.popularAircraft();
			}else {
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
							"user=" + args[0] + ";" +
							"password=" + args[1] + ";" +
							"trustServerCertificate=true");
		} catch (SQLException e) {
			System.out.println("Couldn't Connect to Database");
			e.printStackTrace(System.out);
			System.exit(0);
		}
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
				if (line != "" && line != null) {
					System.out.println(line);
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

	public void runManySQL(String file) {
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

	public void airportsCountry() {
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

	public void airportsForAirline() {
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

	public void specialDestination() {
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

	public void largeAirports() {
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

	public void airplanesForAirlines() {
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

	public void popularCities() {
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

	public void unpopularCities() {
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

	public void popularAircraft() {
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