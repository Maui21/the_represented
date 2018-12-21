view: calendar {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: SELECT '2010-01-01'::DATE + cast(d as integer) AS calendar_date
          FROM (
          SELECT ROW_NUMBER() OVER(ORDER BY id) -1 AS d FROM votes ORDER BY id LIMIT 10000
          ) AS  d
      ;;
  }

  dimension: calendar_date {
    type: date
    sql: ${TABLE}.calendar_date ;;
  }
}
