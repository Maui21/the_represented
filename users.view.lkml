view: users {
  sql_table_name: public.users ;;

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
    hidden: yes
    type: time
    datatype: epoch
    timeframes: [time, minute, hour, date, week, month]
    sql: CAST(${TABLE}.created_at as BIGINT) / 1000;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: link_token {
    hidden: yes
    type: string
    sql: ${TABLE}.link_token ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, votes.count]
  }
}
