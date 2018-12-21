view: poll1 {
  derived_table: {
    sql: SELECT
        polls.id as poll_id,
        choices.id as choice_id,
        title,
        txt
      FROM polls
      LEFT JOIN choices ON polls.id = choices.poll_id
      WHERE polls.id = 19
      GROUP BY 1, 2, 3, 4
      ;;
  }
#

  dimension: poll_id {
    type: string
    sql: ${TABLE}.poll_id;;
    }

  dimension: choice_id {
    type: string
    sql: ${TABLE}.choice_id ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: choices {
    type: string
    sql: ${TABLE}.txt ;;
  }
}

view: poll2 {
  derived_table: {
    sql: SELECT
        polls.id as poll_id,
        choices.id as choice_id,
        title,
        txt
      FROM polls
      LEFT JOIN choices ON polls.id = choices.poll_id
      WHERE polls.id = 89
      GROUP BY 1, 2, 3, 4
      ;;
  }
#
  dimension: poll_id {
    type: string
    sql: ${TABLE}.poll_id;;
  }

  dimension: choice_id {
    type: string
    sql: ${TABLE}.choice_id ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: choices {
    type: string
    sql: ${TABLE}.txt ;;
  }
}
