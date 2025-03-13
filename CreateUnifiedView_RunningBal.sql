select 
    PARSE_DATE('%Y-%m-%d', trns_date) AS timestamp, 
    ddhrnbal,
    NULL AS forecast_value,
    NULL AS prediction_interval_lower_bound,
    NULL AS prediction_interval_upper_bound 
  from `sdb-dig-databroker-demoa8b4.timeseries_ddhist_brad.ddhist_running_balance` 
    where tracct =2710522236 
  UNION ALL
  SELECT
    EXTRACT(DATE FROM forecast_timestamp) as timestamp,
    NULL AS ddhrnbal,
    forecast_value,
    prediction_interval_lower_bound,
    prediction_interval_upper_bound
  FROM
    ML.FORECAST(MODEL `timeseries_ddhist_brad.running_balance_forecast_by_account`, STRUCT(30 AS horizon, 0.90 AS confidence_level)) where Account = '2710522236'
  ORDER BY timestamp
