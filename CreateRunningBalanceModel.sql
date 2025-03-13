CREATE OR REPLACE MODEL
  timeseries_ddhist_brad.running_balance_forecast_by_account
OPTIONS(
  MODEL_TYPE='ARIMA_PLUS',
  TIME_SERIES_TIMESTAMP_COL='TrnDate',
  TIME_SERIES_DATA_COL='Balance',
  TIME_SERIES_ID_COL='Account',
  HOLIDAY_REGION='US',
  AUTO_ARIMA = TRUE,
  AUTO_ARIMA_MAX_ORDER = 2,
  DATA_FREQUENCY = 'DAILY'
) AS
SELECT
  PARSE_DATE('%F', trns_date) as TrnDate,
  CAST(tracct AS STRING) as Account,
  ddhrnbal as Balance
  FROM
  `timeseries_ddhist_brad.ddhist_running_balance`
