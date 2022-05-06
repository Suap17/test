# The name of this view in Looker is "All Objects"
view: all_objects {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `cmt_assess.all_objects`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Complexity" in Explore.

  dimension: complexity {
    type: string
    sql: ${TABLE}.Complexity ;;
  }

  dimension: object_name {
    type: string
    sql: ${TABLE}.Object_Name ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.Type ;;
  }

  measure: count {
    type: count
    drill_fields: [object_name]
  }
}
