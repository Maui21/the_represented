view: votes {
  sql_table_name: public.votes ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: choice {
    type: string
    sql: ${TABLE}.choice ;;
  }

  dimension: choice_created_at {
    hidden: yes
    type: string
    sql: ${TABLE}.choice_created_at ;;
  }

  dimension_group: choice_created {
    hidden: yes
    type: time
    datatype: epoch
    timeframes: [time, minute, hour, date, week, month]
    sql: CAST(${TABLE}.choice_created_at as BIGINT) / 1000;;
  }

  dimension: choice_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.choice_id ;;
  }

  dimension: end_time {
    hidden: yes
    type: string
    sql: ${TABLE}.end_time ;;
  }

  dimension: is_selected {
    type: string
    sql: ${TABLE}.is_selected ;;
  }

  dimension: poll_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.poll_id ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension: voted_time {
    hidden: yes
    type: string
    sql: ${TABLE}.voted_time ;;
  }

  dimension_group: voted_at {
    type: time
    datatype: epoch
    timeframes: [time, minute, hour, date, week, month]
    sql: CAST(${TABLE}.voted_time as BIGINT) / 1000;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      username,
      choices.id,
      users.id,
      users.name,
      polls.id
    ]
  }
}
