proc sql;  											   *Implements SQL code;
	create table combinded as                          *creates a permanent table for the results;
		select d_league.Name,                                        *selects the columns that were needed for D-League data; 
		d_league.free_throw_made, d_league.free_throw_attempted, 
		d_league.percentage, NBA_corresponding.NBA_made, 
		NBA_corresponding.NBA_attempted, 						      *Selects the columns that was needed for NBA data; 
		NBA_corresponding.NBA_percentage
		from d_league inner join NBA_corresponding    *this ensures that their is a match in both rows;   	
		on d_league.Name = NBA_corresponding.Name;    *This is a crucial statement because it ensures that the NBA data and d-league data ;
quit;                                                 *are joined on Name. It makes sure that the d league player data corresponds to nba data for that player;

proc sql;
	select * from combinded;
quit;
