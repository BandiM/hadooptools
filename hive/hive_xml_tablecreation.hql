# creating hive table on xml data 

CREATE EXTERNAL TABLE IF NOT EXISTS la_population(
  zip_code  int,
  total_population  int,
  median_age  double,
  total_males  int,
  total_females  int,
  total_households  int,
  average_household_size  int
  )  
  ROW FORMAT SERDE 'com.ibm.spss.hive.serde2.xml.XmlSerDe'
  
  WITH SERDEPROPERTIES (
"column.xpath.zip_code"="/row/zip_code/text()",
"column.xpath.total_population"="/row/total_population/text()",
"column.xpath.median_age"="/row/median_age/text()",
"column.xpath.total_males"="/row/total_males/text()",
"column.xpath.total_females"="/row/total_females/text()",
"column.xpath.total_households"="/row/total_households/text()",
"column.xpath.average_household_size"="/row/average_household_size/text()"
)
STORED AS
INPUTFORMAT 'com.ibm.spss.hive.serde2.xml.XmlInputFormat'
OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.IgnoreKeyTextOutputFormat' location  '/user/xmldata'
TBLPROPERTIES ( "xmlinput.start"="<response>”,'xmlinput.end'=“</response>");

