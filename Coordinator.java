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
					db.largeAirports(parts[1]);
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
				line = console.nextLine();
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
	

				// Need to ma

				connection.setAutoCommit(fal

					line = scanner.nextLine();
					if 
						System.out.println(line);
						statement.executeUpdate(line);
						
								
								ner.close();
								ection.commit();
				connection.setAutoCommit(
				 catch (SQLException e) {
				e.printStackTrace();
				 catch (FileNot
				
			

		
			ublic void runManySQL(String pathname) {
			try {
				Statement statement = connection.createStat
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
			

						break;
					}
				}
				if (rollBack) {
					System.out.println("ROLL BACK");
					connection.rollback();
				} else {
					connection.commit();
				}
					
					onnection.setAutoCommit(true);
						atch (SQLException e) {
						stem.out.println("FAILURE");
					.
				 
				System.out.print
				
				
			
				blic void airports(i
			try {
				PreparedStatement prepedStatement;
				
			

				ResultSet result = prepedStatement.exec
				if (
					System.out.println("Data:");
					do {
						String name = result.getString("airpor
						System.out.println(name);
					} while (result.
				} else {
					System.out.println("[Nothi
					
						atch (SQLException e) {
					.
				
				
				
				blic void airportsForAirline() {
				ry {
				PreparedStatement prepedStatement;
					tring query = "SELECT
						epedStatement = connection.prepareStatement
						sultSet result =
						 (resu
					S
					
						String name =
						System.out.println(name);
					} while (result.next()
				} else {
					System.out.println("
				}

				e.printStackTrace();
			}
				
				
			ublic void specialDestination() {
				ry {
				
			

				ResultSet result = prepedStatement.
				if (
					System.out.println("Data:");
					do {
						String name = result.getString("AirlineName");
						System.out.println(name);
					} while (result.next());
				} else {
					System.out.println("[Nothing
					
						atch (SQLException e) {
						printStackTrace();
					
				
					
				b
			try {
				PreparedStatement pr
				
			

				ResultSet result = prepedStateme
				if (
					System.out.println("Data:");
					do {
						String name = result.getString("airportName");
						System.out.println(name);
					} while (result.nex
					 else {
					Syst
						
						atch (SQLException e) {
					.printStackTrace();
				
					
				
			ublic void airplanesForAir
				ry {
				
			

					"from flightRoutes " +
					"le
					"where monthFlown is NULL and air
				prepedStatement = connection.prepareStat
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
				String query = "SELECT municipality, count(municipality) " +
						"from flightRoutes " +
						"left join airlines on flightRout
						"left join airports on flightRoutes.origin = air
						"left join cities 
						"group by municipality " +
						"or
						epedStatement = connection.prepareStatement(qu
						sultSet result = prepedSt
					f (result.next()) {
					System.
					do {
					
						System.out.println(name
					} while (result.nex
				
			

			} catch (SQLException e) {
				e.pr
				
				 
						lic void unpopularCiti
						y {
						reparedStatement prepedStatement;
				String query = "SELECT municipality, count(municipali
						"from flightRoutes " +
						"left join airlines on flightRoutes.airlineID = 
						"left join airport
						"left join cities on cities
						"gr
						"order by count(municipality)";
						epedStatement = connectio
					esultSet result = preped
				if (resu
					System.out.println("Data:");
					
						String name = result.ge
						System.out.println
				
			

				}
			} cat
				e.printStackTrace();
				
						
						
						ic void popularAircraft() {
						 {
						eparedStatement prepedStat
						ring query = 
					"SELECT airplane, count(icaoCode) as planes " +
					"FROM airplanes " +
					"LEFT JOIN flightRo
					"GROUP BY airplane " + 
					"ORD
						epedStatement = connection.prepareState
						sultSet result = prepedSt
					f (result.next()) {
					System.
					do {
					
						int count = result.getI
						System.out.println
				
			

				}
			} cat
				e.printStackTrace();
				
						
						
						
						
						
						
				
				
				
					
					
						
						
					
				
					
				
			
				
			
		