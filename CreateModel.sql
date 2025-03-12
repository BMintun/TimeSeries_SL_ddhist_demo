CREATE OR REPLACE MODEL
  timeseries_ddhist_brad.transaction_forecast_by_acct
OPTIONS(
  MODEL_TYPE='ARIMA_PLUS',
  TIME_SERIES_TIMESTAMP_COL='TrnDate',
  TIME_SERIES_DATA_COL='Amount',
  TIME_SERIES_ID_COL='Account',
  HOLIDAY_REGION='US',
  CLEAN_SPIKES_AND_DIPS = TRUE,
  AUTO_ARIMA = TRUE,
  AUTO_ARIMA_MAX_ORDER = 2,
  DATA_FREQUENCY = 'DAILY',
  FORECAST_LIMIT_LOWER_BOUND = 0
) AS
SELECT
  PARSE_DATE('%F', trns_date) as TrnDate,
  CAST(tracct AS STRING) as Account,
  amt as Amount
  FROM
  `timeseries_ddhist_brad.ddhist_timeseries`
