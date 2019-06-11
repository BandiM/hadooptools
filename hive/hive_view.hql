CREATE view if NOT EXISTS la_census (
  zip_code ,
  total_population ,
  median_age ,
  total_males ,
  total_females ,
  total_households,
  average_household_size
  )  
as select row.zip_code,
  row.total_population ,
  row.median_age ,
  row.total_males ,
  row.total_females ,
  row.total_households,
  row.average_household_size
  from la_population;
