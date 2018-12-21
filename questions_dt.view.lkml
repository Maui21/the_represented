view: questions_dt {
  derived_table: {
    sql: SELECT q1.user_id
          , q1.title as title1
          , q1.txt as answer1
          , q2.title as title2
          , q2.txt as answer2
          FROM
          (SELECT
            v1.user_id as user_id
            , c1.txt
            , p1.title as title
            FROM votes v1
            JOIN choices c1 ON v1.choice_id = c1.id
            JOIN polls p1 ON v1.poll_id = p1.id
            WHERE p1.title = {% parameter poll_1 %}
            AND v1.is_selected = '1'
            ) q1
            INNER JOIN
            (
            SELECT
            v2.user_id as user_id
            , c2.txt
            , p2.title as title
            FROM votes v2
            JOIN choices c2 ON v2.choice_id = c2.id
            JOIN polls p2 ON v2.poll_id = p2.id
            {% if questions_dt.poll_2._is_filtered %}
              WHERE p2.title = {% parameter poll_2 %}
            {%else%}
              WHERE 1=1
            {%endif%}
            AND v2.is_selected = '1'
            ) q2
            ON  q1.user_id = q2.user_id
      ;;
  }

  dimension: user_id {
    hidden: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: poll_1_title {
    type: string
    sql: ${TABLE}.title1 ;;
  }

  dimension: poll_2_title {
    type: string
    sql: ${TABLE}.title2 ;;
  }

  dimension: poll_1_choices {
    label_from_parameter: poll_1
    type: string
    sql: ${TABLE}.answer1 ;;
  }

  dimension: poll_2_choices {
    label_from_parameter: poll_2
    type: string
    sql: ${TABLE}.answer2 ;;
  }

  parameter: poll_1 {
    type: string
    suggest_explore: users
    suggest_dimension: polls.title
  }

  parameter: poll_2 {
    type: string
    suggest_explore: users
    suggest_dimension: polls.title
  }

  measure: user_count {
    type: count_distinct
    sql: ${user_id} ;;
  }
}
