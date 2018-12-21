view: choices {
  sql_table_name: public.choices ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: created_at {
    hidden: yes
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: created {
    type: time
    datatype: epoch
    timeframes: [time, minute, hour, date, week, month]
    sql: CAST(${TABLE}.created_at as BIGINT) / 1000;;
  }

  dimension: list_order {
    type: string
    sql: ${TABLE}.list_order ;;
  }

  dimension: poll_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.poll_id ;;
  }

  dimension: choices {
    type: string
    sql: ${TABLE}.txt ;;
  }

  measure: count {
    type: count
    drill_fields: [id, polls.id, votes.count]
  }
}
