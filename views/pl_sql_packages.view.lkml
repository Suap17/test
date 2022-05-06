# The name of this view in Looker is "Pl SQL Packages"
view: pl_sql_packages {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `cmt_assess.pl_sql_packages`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Fail Pass" in Explore.

  dimension: fail_pass {
    type: string
    sql: ${TABLE}.Fail_Pass ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_date_used {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Last_Date_Used ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: number_of_records {
    type: number
    sql: ${TABLE}.Number_of_Records ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_number_of_records {
    type: sum
    sql: ${number_of_records} ;;
  }

  measure: average_number_of_records {
    type: average
    sql: ${number_of_records} ;;
  }

  dimension: owner {
    type: string
    sql: ${TABLE}.Owner ;;
  }

  dimension: pattern {
    type: string
    sql: ${TABLE}.Pattern ;;
  }

  dimension: pattern_of_package {
    type: string
    sql: ${TABLE}.Pattern_of_Package ;;
  }

  dimension: referenced_object_level1 {
    type: string
    sql: ${TABLE}.Referenced_Object_Level1 ;;
  }

  dimension: referenced_object_level2 {
    type: string
    sql: ${TABLE}.Referenced_Object_Level2 ;;
  }

  dimension: referenced_object_level3 {
    type: string
    sql: ${TABLE}.Referenced_Object_Level3 ;;
  }

  dimension: referenced_type_level1 {
    type: string
    sql: ${TABLE}.Referenced_Type_Level1 ;;
  }

  dimension: referenced_type_level2 {
    type: string
    sql: ${TABLE}.Referenced_Type_Level2 ;;
  }

  dimension: referenced_type_level3 {
    type: string
    sql: ${TABLE}.Referenced_Type_Level3 ;;
  }

  dimension: time_taken {
    type: number
    sql: ${TABLE}.Time_Taken ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
