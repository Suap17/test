# The name of this view in Looker is "Schema Conversion Objects"
view: schema_conversion_objects {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `cmt_assess.schema_conversion_objects`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Assessment Bucket" in Explore.

  dimension: assessment_bucket {
    type: string
    sql: ${TABLE}.Assessment_Bucket ;;
  }

  dimension: bucket_count {
    type: number
    sql: ${TABLE}.Bucket_Count ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_bucket_count {
    type: sum
    sql: ${bucket_count} ;;
  }

  measure: average_bucket_count {
    type: average
    sql: ${bucket_count} ;;
  }

  dimension: object {
    type: string
    sql: ${TABLE}.Object ;;
  }

  dimension: object_type {
    type: string
    sql: ${TABLE}.Object_Type ;;
  }

  dimension: src_schema {
    type: string
    sql: ${TABLE}.Src_Schema ;;
  }

  dimension: target_db {
    type: string
    sql: ${TABLE}.Target_DB ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
