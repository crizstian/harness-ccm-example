GCP_PROJECT=""

curl -i -X POST \
  'https://app.harness.io/ccm/api/perspective?accountIdentifier=XXXXXXXXXXXXXXX&clone=false' \
  -H 'Content-Type: application/json' \
  -H 'x-api-key: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
  -d '{
    "viewVersion": "v1",
    "viewTimeRange": {
      "viewTimeRangeType": "LAST_30"
    },
    "viewType": "CUSTOMER",
    "viewVisualization": {
      "groupBy": {
        "fieldId": "product",
        "fieldName": "Product",
        "identifier": "COMMON",
        "identifierName": "COMMON"
      },
      "chartType": "STACKED_LINE_CHART"
    },
    "name": "$GCP_PROJECT",
    "viewRules": [
      {
        "viewConditions": [
          {
            "type": "VIEW_ID_CONDITION",
            "viewField": {
              "fieldId": "gcpProjectId",
              "fieldName": "Project",
              "identifierName": "GCP",
              "identifier": "GCP"
            },
            "viewOperator": "IN",
            "values": [
              "dlk-sem-aut-pro",
              "dlk-sem-aut-qa",
              "dlk-sem-aut-uat"
            ]
          }
        ]
      }
    ],
    "viewState": "COMPLETED",
    "viewPreferences": {
      "showAnomalies": true,
      "includeOthers": true,
      "includeUnallocatedCost": false,
      "awsPreferences": null,
      "gcpPreferences": null
    },
    "uuid": "$GCP_PROJECT",
    "folderId": "G28YNvD8RO6twtwfWGYMgQ"
  }'