view: polls {
  sql_table_name: public.polls_new ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: answer_type {
    type: string
    sql: ${TABLE}.answer_type ;;
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


  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: edited_at {
    hidden: yes
    type: string
    sql: ${TABLE}.edited_at ;;
  }

  dimension: search_text {
    hidden: yes
    type: string
    sql: ${TABLE}.search_text ;;
  }

  dimension: title {
    hidden: yes
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: choices {
    type: string
    sql: jsonb_array_elements(${TABLE}.choices)->>'name' ;;
  }

  measure: count {
    type: count
    drill_fields: [id, choices.count, choices_split.count, votes.count]
  }
}
