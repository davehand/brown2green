<html>
	<head>
		<title>Search Results</title>
		<style>
			body {
				font-family: Sans-Serif;
			}
			table {
				width: 100%;
				border: 1px solid black;
				border-collapse: collapse;
			}
			td, th, tr {
				text-align: center;
				border: 1px solid black;
			}
			th {
				background-color: green;
				color: white;
			}
			td {
				height: 35px;
			}
		</style>
	</head>
	
	<body>
	<h1>Search Results</h1>

		<?php
			#basic search
			function general_search($t, $p, $q) {
		  	
				# connect to psql
				$db_connection = pg_connect("host=csprojects.tcnj.edu
																		port=5432 
																		dbname=team1d 
																		user=team1d 
																		password=pulimood")
																		or die("Could not connect to PSQL\n");

				# Query Database
				# If legislator or expert, join with person to get contact info
				if ($t == "legislator" || $t == "expert") {
					$result = pg_query($db_connection, "SELECT * FROM PERSON, $t WHERE PERSON.id = $t.id AND $p LIKE '%$q%'")
					or die("No results\n");
				} else {
					$result = pg_query($db_connection, "SELECT * FROM $t WHERE $p LIKE '%$q%'")
					or die("No Results\n");
				}

				# Format output for Person
				if ($t == person) {
					echo "<table>";

					echo "<tr>";
					echo "<th>Name</th>";
					echo "<th>Phone</th>";
					echo "<th>Email</th>";
					echo "</tr>";
					
					while($row = pg_fetch_row($result)) {
						echo "<tr><td>$row[1]</td><td>$row[2]</td><td>$row[3]</td><tr>";
					}
					
					echo "</table>";
				}

				# Format output for Expert
				if ($t == expert) {
					echo "<table>";

					echo "<tr>";
					echo "<th>Name</th>";
					echo "<th>Phone</th>";
					echo "<th>Email</th>";
					echo "<th>Area of Expertise</th>";
					echo "<th>Title</th>";
					echo "</tr>";
					
					while($row = pg_fetch_row($result)) {
						echo "<tr><td>$row[1]</td><td>$row[2]</td><td>$row[3]</td><td>$row[7]</td><td>$row[8]</td></tr>";
					}
					
					echo "</table>";
				}

				# Format output for legislator
				if ($t == legislator) {
					echo "<table>";
					
					echo "<tr>";
					echo "<th>Name</th>";
					echo "<th>Party</th>";
					echo "<th>State</th>";
					echo "<th>District No.</th>";
					echo "<th>Day Elected</th>";
					echo "</tr>";
					
					while($row = pg_fetch_row($result)) {
						echo "<tr><td>$row[1]</td><td>$row[7]</td><td>$row[10]</td><td>$row[8]</td><td>$row[9]</td><tr>";
					}
					
					echo "</table>";
				}
				
				# Format output for affiliation
				if ($t == affiliation) {
					echo "<table>";
				
					echo "<tr>";
					echo "<th>Name</th>";
					echo "<th>Phone</th>";
					echo "<th>Street</th>";
					echo "<th>City</th>";
					echo "<th>State</th>";
					echo "<th>Zipcode</th>";
					echo "</tr>";
					
					while($row = pg_fetch_row($result)) {
						echo "<tr><td>$row[0]</td><td>$row[1]</td><td>$row[2]</td><td>$row[3]</td><td>$row[4]</td><td>$row[5]</td><tr>";
					}
					
					echo "</table>";
				}
			}	

			# Pass POST parameters to the general search function
			general_search($_POST["t"], $_POST["p"], $_POST["q"])

		?><br>

	</body>
</html>
