# The name of this view in Looker is "Reports"
view: reports {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `cmt_assess.reports`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called " 0 Day" in Explore.

  dimension: _0_day {
    type: number
    sql: ${TABLE}._0_Day ;;
  }

  dimension: _180___90_days {
    type: number
    sql: ${TABLE}._180___90_Days ;;
  }

  dimension: _180___days {
    type: number
    sql: ${TABLE}._180___Days ;;
  }

  dimension: _1_day {
    type: number
    sql: ${TABLE}._1_Day ;;
  }

  dimension: _1_day_6 {
    type: number
    sql: ${TABLE}._1_Day_6 ;;
  }

  dimension: _2___30_days {
    type: number
    sql: ${TABLE}._2___30_Days ;;
  }

  dimension: _30___2_days {
    type: number
    sql: ${TABLE}._30___2_Days ;;
  }

  dimension: _30___60_days {
    type: number
    sql: ${TABLE}._30___60_Days ;;
  }

  dimension: _60___30_days {
    type: number
    sql: ${TABLE}._60___30_Days ;;
  }

  dimension: _60___90_days {
    type: number
    sql: ${TABLE}._60___90_Days ;;
  }

  dimension: _90___180_days {
    type: number
    sql: ${TABLE}._90___180_Days ;;
  }

  dimension: _90___60_days {
    type: number
    sql: ${TABLE}._90___60_Days ;;
  }

  dimension: __180_days {
    type: number
    sql: ${TABLE}.__180_Days ;;
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

  dimension: report_category {
    type: string
    sql: ${TABLE}.Report_Category ;;
  }

  dimension: report_name {
    type: string
    sql: ${TABLE}.Report_Name ;;
  }

  dimension: report_sla {
    type: string
    sql: ${TABLE}.Report_SLA ;;
  }

  dimension: report_type {
    type: string
    sql: ${TABLE}.Report_Type ;;
  }

  dimension: times_executed {
    type: number
    sql: ${TABLE}.Times_Executed ;;
  }

  measure: count {
    type: count
    drill_fields: [report_name]
  }
}
