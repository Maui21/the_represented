view: demographics {
  sql_table_name: public.demographics ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: assist_ancestor {
    hidden: yes
    type: number
    sql: ${TABLE}.assist_ancestor ;;
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: demographic {
    type: string
    sql: ${TABLE}.demographic ;;
  }

  dimension: us_state {
    type: string
    sql: CASE WHEN 'Alabama' THEN 'Alabama'
           WHEN 'Alaska' THEN 'Alaska'
           WHEN 'Arizona' THEN 'Arizona'
           WHEN 'Arkansas' THEN 'Arkansas'
           WHEN 'California' THEN 'California'
           WHEN 'Colorado' THEN 'Colorado'
           WHEN 'Connecticut' THEN 'Connecticut'
           WHEN 'Delaware' THEN 'Delaware'
           WHEN 'Florida' THEN 'Florida'
           WHEN 'Georgia' THEN 'Georgia'
           WHEN 'Hawaii' THEN 'Hawaii'
           WHEN 'Idaho' THEN 'Idaho'
           WHEN 'Illinois' THEN 'Illinois'
           WHEN 'Indiana' THEN 'Indiana'
           WHEN 'Iowa' THEN 'Iowa'
           WHEN 'Kansas' THEN 'Kansas'
           WHEN 'Kentucky' THEN 'Kentucky'
           WHEN 'Louisiana' THEN 'Louisiana'
           WHEN 'Maine' THEN 'Maine'
           WHEN 'Maryland' THEN 'Maryland'
           WHEN 'Massachusetts' THEN 'Massachusetts'
           WHEN 'Michigan' THEN 'Michigan'
           WHEN 'Minnesota' THEN 'Minnesota'
           WHEN 'Mississippi' THEN 'Mississippi'
           WHEN 'Missouri' THEN 'Missouri'
           WHEN 'Montana' THEN 'Montana'
           WHEN 'Nebraska' THEN 'Nebraska'
           WHEN 'Nevada' THEN 'Nevada'
           WHEN 'New Hampshire' THEN 'New Hampshire'
           WHEN 'New Jersey' THEN 'New Jersey'
           WHEN 'New Mexico' THEN 'New Mexico'
           WHEN 'New York' THEN 'New York'
           WHEN 'North Carolina' THEN 'North Carolina'
           WHEN 'North Dakota' THEN 'North Dakota'
           WHEN 'Ohio' THEN 'Ohio'
           WHEN 'Oklahoma' THEN 'Oklahoma'
           WHEN 'Oregon' THEN 'Oregon'
           WHEN 'Pennsylvania' THEN 'Pennsylvania'
           WHEN 'Rhode Island' THEN 'Rhode Island'
           WHEN 'South Carolina' THEN 'South Carolina'
           WHEN 'South Dakota' THEN 'South Dakota'
           WHEN 'Tennessee' THEN 'Tennessee'
           WHEN 'Texas' THEN 'Texas'
           WHEN 'Utah' THEN 'Utah'
           WHEN 'Vermont' THEN 'Vermont'
           WHEN 'Virginia' THEN 'Virginia'
           WHEN 'Washington' THEN 'Washington'
           WHEN 'West Virginia' THEN 'West Virginia'
           WHEN 'Wisconsin' THEN 'Wisconsin'
           WHEN 'Wyoming' THEN 'Wyoming'
          ELSE NULL END ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: harmony {
    hidden: yes
    type: string
    sql: ${TABLE}.harmony ;;
  }

  dimension: list_order {
    hidden: yes
    type: string
    sql: ${TABLE}.list_order ;;
  }

  dimension: meaning {
    hidden: yes
    type: string
    sql: ${TABLE}.meaning ;;
  }

  dimension: no_suggest {
    hidden: yes
    type: number
    sql: ${TABLE}.no_suggest ;;
  }

  dimension: style {
    type: string
    sql: ${TABLE}.style ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
