# The name of this view in Looker is "Lineage Audit Trail"
view: lineage_audit_trail {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `cmt_assess.lineage_audit_trail`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called " Failed" in Explore.

  dimension: __failed {
    type: number
    sql: ${TABLE}.__Failed ;;
  }

  dimension: __passed {
    type: number
    sql: ${TABLE}.__Passed ;;
  }

  dimension: calculation1 {
    type: number
    sql: ${TABLE}.Calculation1 ;;
  }

  dimension: count_of_fail {
    type: number
    sql: ${TABLE}.Count_of_fail ;;
  }

  dimension: count_of_functions {
    type: number
    sql: ${TABLE}.count_of_functions ;;
  }

  dimension: count_of_package {
    type: number
    sql: ${TABLE}.count_of_package ;;
  }

  dimension: count_of_pass {
    type: number
    sql: ${TABLE}.Count_of_Pass ;;
  }

  dimension: detail_messages {
    type: string
    sql: ${TABLE}.Detail_Messages ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.Last_Updated_Time ;;
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

  dimension: package_name {
    type: string
    sql: ${TABLE}.Package_Name ;;
  }

  dimension: package_type {
    type: string
    sql: ${TABLE}.Package_Type ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: structure_name {
    type: string
    sql: ${TABLE}.Structure_Name ;;
  }

  dimension: structure_type {
    type: string
    sql: ${TABLE}.Structure_Type ;;
  }

  measure: count {
    type: count
    drill_fields: [structure_name, package_name]
  }
}
