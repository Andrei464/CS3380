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
			try{
				parts = line.split("\\s+");
				if (line.indexOf(" ") > 0)
					arg = line.substring(line.indexOf(" ")).trim();
				if (parts[0].equals("help")) {
					System.out.println(
						"Commands List:\n" +
						"help - help\n" +
						"drop - drops all tables\n" +
						"repopulate - repopulates the entire database\n" +
						"airports - returns all airports in a country\n" +
						"airlineAirports - selects which airports house a given airline\n" +
						"specialDest - selects which routes are connected to a given destination\n" +
						"largeAirports - selects all large airports\n" +
						"airplanesAirlines - selects which airplanes are used by a given airline\n" +
						"popularCities - selects the city with the most airlines\n" +
						"unpopularCities - selects the city with the least airlines\n" +
						"popularAircraft - select the 5 most used aircraft\n"
					);
				} else if (parts[0].equals("repopulate")) {
					db.repopulate();
				} else if (parts[0].equals("drop")) {
					db.runSQLStatements("Queries/dropAll.sql");
				} else if (parts[0].equals("airports")) {
					db.airportsCountry();
				} else if (parts[0].equals("airlineAirports")) {
					db.airportsForAirline();
				} else if (parts[0].equals("specialDest")) {
					db.specialDestination();
				} else if (parts[0].equals("largeAirports")) {
					db.largeAirports(parts[0]);
				} else if (parts[0].equals("airplanesAirlines")) {
					db.airplanesForAirlines(parts[1]);
				} else if (parts[0].equals("popularCities")) {
					db.popularCities();
				} else if (parts[0].equals("unpopularCities")) {
					db.unpopularCities();
				} else if (parts[0].equals("popularAircraft")) {
					db.popularAircraft();
				} else {
					System.out.println("Type help for all commands, or pray <3");
				}
				System.out.print("db > ");
				line = console.nextLine();
			}catch(ArrayIndexOutOfBoundsException e){
				System.out.print("Need more arguments");
			}
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

	public void repopulate() {
		System.out.println("Dropping all tables...");
		this.runSQLStatements("Queries/dropAll.sql");
		System.out.println("Inserting Contintents");
		this.runManySQL("Queries/insert_continents.sql");
		System.out.println("Inserting Countries");
		this.runManySQL("Queries/insert_countries.sql");
		System.out.println("Inserting Cities");
		this.runManySQL("Queries/insert_cities.sql");
		System.out.println("Inserting Airports");
		this.runManySQL("Queries/insert_airports.sql");
		System.out.println("Inserting Airlines");
		this.runManySQL("Queries/insert_airlines.sql");
		System.out.println("Inserting Planes");
		this.runManySQL("Queries/insert_airplanes.sql");
		System.out.println("Inserting Routes");
		this.runManySQL("Queries/insert_flightroutes.sql");
		System.out.println("Inserting Active Flights");
		this.runManySQL("Queries/insert_activeFlights.sql");
		System.out.println("DONE");
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

	public void runManySQL(String pathname) {
		try {
			Statement statement = connection.createStatement();
			File database = new File(pathname);
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
			String query = "SELECT airportName FROM airports";// INNER JOIN cities on airport.cityID = cities.cityID
																// where cities.iso_country = ?";
			prepedStatement = connection.prepareStatement(query);
			// prepedStatement.setString(1, country);
			ResultSet result = prepedStatement.executeQuery();
			if (result.next()) {
				System.out.println("Data:");
				do {
					String name = result.getString("airportName");
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
					String name = result.getString("AirlineName");
					System.out.println(name);
				} while (result.next());
			} else {
				System.out.println("[Nothing Found]");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void largeAirports(String size) {
		try {
			PreparedStatement prepedStatement;
			String query = "SELECT airportName FROM airport where airport.airportSize = '?'";
			prepedStatement = connection.prepareStatement(query);
			prepedStatement.setString(1, size);
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

	public void airplanesForAirlines(String airline) {
		try {
			PreparedStatement prepedStatement;
			String query = 
				"SELECT aircraftID " + 
				"from flightRoutes " +
				"left join airlines on flightRoutes.airlineID = airlines.AirlineID " +
				"where monthFlown is NULL and airlines.IATA = ?";
			prepedStatement = connection.prepareStatement(query);
			prepedStatement.setString(1, airline);
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
			String query = 
				"SELECT municipality, count(municipality) " + 
				"from flightRoutes " + 
				"left join airlines on flightRoutes.airlineID = airlines.AirlineID " + 
				"left join airports on flightRoutes.origin = airports.iataCode " + 
				"left join cities on cities.city_id = airports.city_id " + 
				"group by municipality " + 
				"order by count(municipality)";
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
			String query = 
				"SELECT municipality, count(municipality) " + 
				"from flightRoutes " + 
				"left join airlines on flightRoutes.airlineID = airlines.AirlineID " + 
				"left join airports on flightRoutes.destination = airports.iataCode " + 
				"left join cities on cities.city_id = airports.city_id " + 
				"group by municipality " + 
				"order by count(municipality)";
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
			String query = 
				"SELECT airplane, count(icaoCode) as planes " +
				"FROM airplanes " +
				"LEFT JOIN flightRoutes on airplanes.icaoCode = flightRoutes.aircraftID " +
				"GROUP BY airplane " + 
				"ORDER BY count(icaoCode)";
			prepedStatement = connection.prepareStatement(query);
			ResultSet result = prepedStatement.executeQuery();
			if (result.next()) {
				System.out.println("Data: [airplane name]\t\t\t[amount flown]");
				do {
					String name = result.getString("airplane");
					int count = result.getInt("planes");
					System.out.println(name + "\t\t\t" + count);
				} while (result.next());
			} else {
				System.out.println("[Nothing Found]");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}