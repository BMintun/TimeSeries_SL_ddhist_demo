Select * from ML.FORECAST(MODEL `timeseries_ddhist_brad.transaction_forecast_by_acct`, 
  STRUCT(30 AS horizon, 
  0.90 AS confidence_level)) 
  where Account = '1'
