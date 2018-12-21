connection: "postgres_db"

# include all the views
include: "*.view"

datagroup: the_represented_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: the_represented_default_datagroup

explore: votes {}

explore: polls {}

explore: users {
  fields: [ALL_FIELDS*, -users.name, -users.id, -users.email]
  join: user_demographics {
    view_label: "Demographics Selection"
#     fields: [user_demographics.demographic, user_demographics.num_value, user_demographics.us_state, user_demographics.age, user_demographics.gender, user_demographics.income_tier]
    type: left_outer
    sql_on: ${users.id} = ${user_demographics.user_id} ;;
    relationship: one_to_many
  }

  join: votes {
    fields: []
    type: left_outer
    sql_on: ${votes.user_id} = ${users.id} ;;
    relationship: one_to_many
  }

  join: choices {
    view_label: "Choices"
    fields: []
    type: left_outer
    sql_on: ${votes.choice_id} = ${choices.id} ;;
    relationship: many_to_many
  }

  join: polls {
    fields: [polls.title]
    type: left_outer
    sql_on: ${choices.poll_id} = ${polls.id} ;;
    relationship: one_to_many
  }

  join: questions_dt {
    view_label: "Polls Selection"
    type:  left_outer
    sql_on: ${users.id} = ${questions_dt.user_id} ;;
    relationship: one_to_many
  }
}
