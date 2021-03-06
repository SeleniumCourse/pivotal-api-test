@CleanEnvironment
Feature: Testing for login Pivotal page

  @smoke @deleteAllProject
  Scenario: Create project
    Given I send a POST request to /projects
      | name   | TestCreateProjects |
      | public | true               |
    Then I expect the status code 200
    Then validate the schema:
    """
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "type": "object",
  "properties": {
    "id": {
      "type": "integer"
    },
    "kind": {
      "type": "string"
    },
    "name": {
      "type": "string"
    },
    "version": {
      "type": "integer"
    },
    "iteration_length": {
      "type": "integer"
    },
    "week_start_day": {
      "type": "string"
    },
    "point_scale": {
      "type": "string"
    },
    "point_scale_is_custom": {
      "type": "boolean"
    },
    "bugs_and_chores_are_estimatable": {
      "type": "boolean"
    },
    "automatic_planning": {
      "type": "boolean"
    },
    "enable_tasks": {
      "type": "boolean"
    },
    "time_zone": {
      "type": "object",
      "properties": {
        "kind": {
          "type": "string"
        },
        "olson_name": {
          "type": "string"
        },
        "offset": {
          "type": "string"
        }
      },
      "required": [
        "kind",
        "olson_name",
        "offset"
      ]
    },
    "velocity_averaged_over": {
      "type": "integer"
    },
    "number_of_done_iterations_to_show": {
      "type": "integer"
    },
    "has_google_domain": {
      "type": "boolean"
    },
    "enable_incoming_emails": {
      "type": "boolean"
    },
    "initial_velocity": {
      "type": "integer"
    },
    "public": {
      "type": "boolean"
    },
    "atom_enabled": {
      "type": "boolean"
    },
    "project_type": {
      "type": "string"
    },
    "start_time": {
      "type": "string"
    },
    "created_at": {
      "type": "string"
    },
    "updated_at": {
      "type": "string"
    },
    "account_id": {
      "type": "integer"
    },
    "current_iteration_number": {
      "type": "integer"
    },
    "enable_following": {
      "type": "boolean"
    }
  },
  "required": [
    "id",
    "name"
  ]
}
    """