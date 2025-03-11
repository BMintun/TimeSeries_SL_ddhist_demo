CREATE OR REPLACE MODEL
  timeseries_ddhist_brad.transaction_forecast_by_acct
OPTIONS(
  MODEL_TYPE='ARIMA',
  TIME_SERIES_TIMESTAMP_COL='TrnDate',
  TIME_SERIES_DATA_COL='Amount',
  TIME_SERIES_ID_COL='Account',
  HOLIDAY_REGION='US'
) AS
SELECT
  PARSE_DATE('%F', trns_date) as TrnDate,
  CAST(tracct AS STRING) as Account,
  amt as Amount
  FROM
  `timeseries_ddhist_brad.ddhist_timeseries`
