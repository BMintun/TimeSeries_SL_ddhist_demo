CREATE OR REPLACE VIEW account_forecast_view.timeseries_ddhist_brad
AS (
  */

  select 
    PARSE_DATE('%Y-%m-%d', trns_date) AS timestamp, 
    amt,
    NULL AS forecast_value,
    NULL AS prediction_interval_lower_bound,
    NULL AS prediction_interval_upper_bound 
  from `sdb-dig-databroker-demoa8b4.timeseries_ddhist_brad.ddhist_timeseries` 
    where tracct =2710522236 
  UNION ALL
  SELECT
    EXTRACT(DATE FROM forecast_timestamp) as timestamp,
    NULL AS amt,
    forecast_value,
    prediction_interval_lower_bound,
    prediction_interval_upper_bound
  FROM
    ML.FORECAST(MODEL `timeseries_ddhist_brad.transaction_forecast_by_acct`, STRUCT(30 AS horizon, 0.90 AS confidence_level)) where Account = '2710522236'
  ORDER BY timestamp

