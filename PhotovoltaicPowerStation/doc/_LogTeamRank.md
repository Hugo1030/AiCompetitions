# 团队成绩索引

| 提交日期 | 策略 | 成绩 | 数据集 | 提交/代交人 |
| - | ----- | --------- | - | - |
| 2018-08-04 |  lightgbm 两个版本融合 (一个 select/ 一个没有) | 0.8436 |result_20180804a_ensemble.csv |沥川|
| 2018-08-03 |  调参后融合 | 0.8447 |result_20180803a_ensemble.csv |沥川|
| 2018-08-03 |  xgboost 贝叶斯调参 | 0.8313 |result_20180803a_xgboost-bo.csv   |沥川|
| 2018-08-03 |  lightgbm 贝叶斯调参, 不进行 select | 0.8436 |result_20180803a_lightgbm-bo.csv  |沥川|
| 2018-08-02 |  GBRT*0.4 + lightgbm*0.4 + xgboost*0.2 | 0.8439 |result_20180802a_ensemble.csv |沥川|
| 2018-08-02 |  GBRT 数据清洗 | 0.8409 |result_20180802a_GBRT-cleandata.csv  |沥川|
| 2018-08-01 |  xgboost 数据清洗 | 0.8382 |result_20180801a_xgboost-cleandata.csv |沥川|
| 2018-08-01 |  lightgbm 数据清洗 | 0.8419 |result_20180801a_lightgbm-cleandata.csv |沥川|
| 2018-07-31 |  xgboost 和 lightgbm 简单融合 | 0.8313 |result_20180731a_ensemble.csv|沥川|
| 2018-07-31 |  xgboost 数据清洗 | 0.7629 |result_20180731a_xgboost-baseline.csv|沥川|
| 2018-07-30 |  lightgbm 原始数据 baseline| 0.8276 |result_20180730a_lightgbm-baseline.csv|沥川|
| 2018-07-30 |  xgboost 改了点参数| 0.8217 |result_20180730b_xgboost-baseline.csv|沥川|
| 2018-07-30 |  xgboost 原始数据 baseline|  0.8256 |result_20180730_xgboost-baseline.csv|沥川|