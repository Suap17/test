# The name of this view in Looker is "Schema Objects"
view: schema_objects {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `cmt_assess.schema_objects`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called " of Schemas" in Explore.

  dimension: __of_schemas {
    type: number
    sql: ${TABLE}.__of_Schemas ;;
  }

  dimension: complexity_of_pkg {
    type: string
    sql: ${TABLE}.Complexity_of_Pkg ;;
  }

  dimension: count_of_packages {
    type: number
    sql: ${TABLE}.Count_of_packages ;;
  }

  dimension: data_volume {
    type: string
    sql: ${TABLE}.Data_volume ;;
  }

  dimension: kpi {
    type: string
    sql: ${TABLE}.KPI ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_used {
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
    sql: ${TABLE}.Last_Used_Date ;;
  }

  dimension: num_rows {
    type: number
    sql: ${TABLE}.Num_Rows ;;
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

  dimension: object_type {
    type: string
    sql: ${TABLE}.Object_Type ;;
  }

  dimension: owner {
    type: string
    sql: ${TABLE}.Owner ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.Table_Name ;;
  }

  dimension: used_count {
    type: number
    sql: ${TABLE}.Used_Count ;;
  }

  measure: count {
    type: count
    drill_fields: [table_name]
  }
}
