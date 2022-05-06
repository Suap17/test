# The name of this view in Looker is "All Packages"
view: all_packages {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `cmt_assess.all_packages`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_updated {
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
    sql: ${TABLE}.Last_Updated_Date ;;
  }

  dimension_group: last_updated_date {
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
    sql: ${TABLE}.Last_Updated_Date_Time ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Last Updated Time Split 2" in Explore.

  dimension: last_updated_time_split_2 {
    type: string
    sql: ${TABLE}.Last_Updated_Time_Split_2 ;;
  }

  dimension: object_name {
    type: string
    sql: ${TABLE}.Object_Name ;;
  }

  dimension: one_month_filter {
    type: yesno
    sql: ${TABLE}.One_month_filter ;;
  }

  measure: count {
    type: count
    drill_fields: [object_name]
  }
}
