view: user_demographics {
  sql_table_name: public.user_demographics ;;

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: demo_created_at {
    hidden: yes
    type: time
    sql: ${TABLE}.demo_created_at ;;
  }

  dimension: demo_id {
    hidden: yes
    type: number
    sql: ${TABLE}.demo_id ;;
  }

  dimension: demo_style {
    hidden: yes
    type: string
    sql: ${TABLE}.demo_style ;;
  }

  dimension: demographic {
    type: string
    sql: ${TABLE}.demographic ;;
  }

  dimension: income {
    hidden: yes
    type: number
    sql: CASE WHEN ${demographic} = 'Income ($/yr)' THEN ${num_value} ELSE NULL END ;;
  }

  dimension: income_tier {
    type: tier
    tiers: [20000, 50000, 75000, 100000, 150000, 250000, 1000000]
    sql: ${income} ;;
    style: integer
  }

  dimension: gender {
    type: string
    sql: CASE WHEN ${demographic} = 'Male' THEN 'Male'
              WHEN ${demographic} = 'Female' THEN 'Female'
            ELSE NULL END;;
  }

  dimension: us_state {
    label: "US State"
    type: string
    map_layer_name: us_states
    sql: CASE WHEN ${demographic} = 'Alabama' THEN 'Alabama'
           WHEN ${demographic} = 'Alaska' THEN 'Alaska'
           WHEN ${demographic} = 'Arizona' THEN 'Arizona'
           WHEN ${demographic} = 'Arkansas' THEN 'Arkansas'
           WHEN ${demographic} = 'California' THEN 'California'
           WHEN ${demographic} = 'Colorado' THEN 'Colorado'
           WHEN ${demographic} = 'Connecticut' THEN 'Connecticut'
           WHEN ${demographic} = 'Delaware' THEN 'Delaware'
           WHEN ${demographic} = 'Florida' THEN 'Florida'
           WHEN ${demographic} = 'Georgia' THEN 'Georgia'
           WHEN ${demographic} = 'Hawaii' THEN 'Hawaii'
           WHEN ${demographic} = 'Idaho' THEN 'Idaho'
           WHEN ${demographic} = 'Illinois' THEN 'Illinois'
           WHEN ${demographic} = 'Indiana' THEN 'Indiana'
           WHEN ${demographic} = 'Iowa' THEN 'Iowa'
           WHEN ${demographic} = 'Kansas' THEN 'Kansas'
           WHEN ${demographic} = 'Kentucky' THEN 'Kentucky'
           WHEN ${demographic} = 'Louisiana' THEN 'Louisiana'
           WHEN ${demographic} = 'Maine' THEN 'Maine'
           WHEN ${demographic} = 'Maryland' THEN 'Maryland'
           WHEN ${demographic} = 'Massachusetts' THEN 'Massachusetts'
           WHEN ${demographic} = 'Michigan' THEN 'Michigan'
           WHEN ${demographic} = 'Minnesota' THEN 'Minnesota'
           WHEN ${demographic} = 'Mississippi' THEN 'Mississippi'
           WHEN ${demographic} = 'Missouri' THEN 'Missouri'
           WHEN ${demographic} = 'Montana' THEN 'Montana'
           WHEN ${demographic} = 'Nebraska' THEN 'Nebraska'
           WHEN ${demographic} = 'Nevada' THEN 'Nevada'
           WHEN ${demographic} = 'New Hampshire' THEN 'New Hampshire'
           WHEN ${demographic} = 'New Jersey' THEN 'New Jersey'
           WHEN ${demographic} = 'New Mexico' THEN 'New Mexico'
           WHEN ${demographic} = 'New York' THEN 'New York'
           WHEN ${demographic} = 'North Carolina' THEN 'North Carolina'
           WHEN ${demographic} = 'North Dakota' THEN 'North Dakota'
           WHEN ${demographic} = 'Ohio' THEN 'Ohio'
           WHEN ${demographic} = 'Oklahoma' THEN 'Oklahoma'
           WHEN ${demographic} = 'Oregon' THEN 'Oregon'
           WHEN ${demographic} = 'Pennsylvania' THEN 'Pennsylvania'
           WHEN ${demographic} = 'Rhode Island' THEN 'Rhode Island'
           WHEN ${demographic} = 'South Carolina' THEN 'South Carolina'
           WHEN ${demographic} = 'South Dakota' THEN 'South Dakota'
           WHEN ${demographic} = 'Tennessee' THEN 'Tennessee'
           WHEN ${demographic} = 'Texas' THEN 'Texas'
           WHEN ${demographic} = 'Utah' THEN 'Utah'
           WHEN ${demographic} = 'Vermont' THEN 'Vermont'
           WHEN ${demographic} = 'Virginia' THEN 'Virginia'
           WHEN ${demographic} = 'Washington' THEN 'Washington'
           WHEN ${demographic} = 'West Virginia' THEN 'West Virginia'
           WHEN ${demographic} = 'Wisconsin' THEN 'Wisconsin'
           WHEN ${demographic} = 'Wyoming' THEN 'Wyoming'
          ELSE NULL END ;;
  }

  dimension: is_selected {
    hidden: yes
    type: number
    sql: ${TABLE}.is_selected ;;
  }

  dimension: num_value {
    type: number
    sql: CAST(${TABLE}.num_value as float) ;;
  }

  dimension: age {
    type: number
    sql: CASE WHEN ${demographic} = 'Age' THEN round(extract(year from now()) - (1970 + (extract(epoch from now()) - ${num_value}) / (1000.0 * 60 * 60 * 24 * 365))) ELSE NULL END;;
  }

  dimension: start_at {
    hidden: yes
    type: number
    sql: CAST(${TABLE}.start_time as BIGINT) ;;
  }

  dimension_group: start {
    type: time
    sql: to_timestamp(((${start_at})/1000)::double precision) ;;
  }

  dimension: end_at {
    type: number
    sql: CAST(${TABLE}.end_time as BIGINT)  ;;
  }

  dimension_group: end {
    type: time
    sql: to_timestamp(((${end_at})/1000)::double precision) ;;
  }

  dimension: user_id {
    hidden: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: username {
    hidden: yes
    type: string
    sql: ${TABLE}.username ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id, username]
  }
}
