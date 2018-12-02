>>> 18.8.2
- 调参 gbrt, ploy + seclet
```
Initialization
------------------------------------------------------------
 Step |   Time |      Value |   max_depth |   n_estimators | 
    1 | 04m17s |    0.88928 |      5.2015 |      5611.3857 | 
    2 | 08m30s |    0.88767 |      9.8151 |      7358.5853 | 
    3 | 05m36s |    0.88928 |      5.3633 |      7559.6278 | 
    4 | 07m02s |    0.89188 |      6.3352 |      8551.1300 | 
    5 | 05m42s |    0.88928 |      5.2315 |      7945.1096 | 
Bayesian Optimization
------------------------------------------------------------
 Step |   Time |      Value |   max_depth |   n_estimators | 
    6 | 00m11s |    0.88967 |      6.5478 |       100.0683 | 
    7 | 02m03s |    0.88927 |      5.0103 |      2344.9942 | 
    8 | 06m42s |    0.88928 |      5.1478 |      9999.7556 | 
    9 | 03m30s |    0.88928 |      5.0034 |      3893.6679 | 
   10 | 01m09s |    0.88914 |      5.0059 |      1033.2178 | 
   11 | 07m23s |    0.88928 |      5.0197 |      9374.3662 | 
   12 | 04m28s |    0.88928 |      5.0001 |      4768.8030 | 
   13 | 03m02s |    0.88928 |      5.0011 |      3077.9292 | 
   14 | 00m31s |    0.88835 |      5.0099 |       488.0452 | 
   15 | 06m34s |    0.88928 |      5.0090 |      8845.5375 | 
   16 | 01m36s |    0.88921 |      5.0217 |      1695.9306 | 
   17 | 05m19s |    0.88928 |      5.0073 |      6310.1348 | 
   18 | 06m30s |    0.88928 |      5.0197 |      8392.5217 | 
   19 | 05m34s |    0.88767 |      9.9833 |      4343.3856 | 
   20 | 10m37s |    0.88767 |      9.9952 |      9732.9851 | 
   21 | 06m34s |    0.88767 |      9.9628 |      5198.5803 | 
   22 | 04m30s |    0.88767 |      9.9884 |      3484.0699 | 
   23 | 07m06s |    0.88767 |      9.9694 |      5981.1627 |
```
Initialization
------------------------------------------------------------
 Step |   Time |      Value |   max_depth |   n_estimators | 
    1 | 04m17s |    0.88928 |      5.2015 |      5611.3857 | 
    2 | 08m30s |    0.88767 |      9.8151 |      7358.5853 | 
    3 | 05m36s |    0.88928 |      5.3633 |      7559.6278 | 
    4 | 07m02s |    0.89188 |      6.3352 |      8551.1300 | 
    5 | 05m42s |    0.88928 |      5.2315 |      7945.1096 | 
Bayesian Optimization
------------------------------------------------------------
 Step |   Time |      Value |   max_depth |   n_estimators | 
    6 | 00m11s |    0.88967 |      6.5478 |       100.0683 | 
    7 | 02m03s |    0.88927 |      5.0103 |      2344.9942 | 
    8 | 06m42s |    0.88928 |      5.1478 |      9999.7556 | 
    9 | 03m30s |    0.88928 |      5.0034 |      3893.6679 | 
   10 | 01m09s |    0.88914 |      5.0059 |      1033.2178 | 
   11 | 07m23s |    0.88928 |      5.0197 |      9374.3662 | 
   12 | 04m28s |    0.88928 |      5.0001 |      4768.8030 | 
   13 | 03m02s |    0.88928 |      5.0011 |      3077.9292 | 
   14 | 00m31s |    0.88835 |      5.0099 |       488.0452 | 
   15 | 06m34s |    0.88928 |      5.0090 |      8845.5375 | 
   16 | 01m36s |    0.88921 |      5.0217 |      1695.9306 | 
   17 | 05m19s |    0.88928 |      5.0073 |      6310.1348 | 
   18 | 06m30s |    0.88928 |      5.0197 |      8392.5217 | 
   19 | 05m34s |    0.88767 |      9.9833 |      4343.3856 | 
   20 | 10m37s |    0.88767 |      9.9952 |      9732.9851 | 
   21 | 06m34s |    0.88767 |      9.9628 |      5198.5803 | 
   22 | 04m30s |    0.88767 |      9.9884 |      3484.0699 | 
   23 | 07m06s |    0.88767 |      9.9694 |      5981.1627 |
- 调参 lightgbm, Poly, no select
```
Initialization
-------------------------------------------------------------------------
 Step |   Time |      Value |   min_data |   num_leaves |   sub_feature | 
    1 | 01m19s |    0.89886 |    53.4367 |      41.5701 |        0.6240 | 
    2 | 01m32s |    0.89857 |    29.1883 |      49.9149 |        0.5802 | 
    3 | 00m48s |    0.89630 |    43.5590 |      26.0060 |        0.5672 | 
    4 | 02m21s |    0.89816 |    30.6583 |      73.3697 |        0.8048 | 
    5 | 02m14s |    0.89942 |    41.9395 |      68.3511 |        0.6710 | 
Bayesian Optimization
-------------------------------------------------------------------------
 Step |   Time |      Value |   min_data |   num_leaves |   sub_feature | 
    6 | 01m55s |    0.89893 |    79.8069 |      89.9313 |        0.6513 | 
    7 | 01m43s |    0.89902 |    79.8194 |      62.8371 |        0.5184 | 
    8 | 02m17s |    0.89816 |    60.5993 |      63.0828 |        0.9991 | 
    9 | 02m23s |    0.90004 |    54.8808 |      89.4763 |        0.5014 | 
   10 | 01m57s |    0.89995 |    55.7635 |      65.3022 |        0.5004 | 
   11 | 00m54s |    0.89585 |    79.9497 |      24.4293 |        0.5124 | 
   12 | 02m15s |    0.89946 |    57.1320 |      81.7269 |        0.5074 | 
   13 | 03m02s |    0.89616 |    10.1321 |      89.7203 |        0.5825 | 
   14 | 02m38s |    0.89954 |    36.8466 |      89.6987 |        0.5040 | 
   15 | 01m56s |    0.89922 |    46.1155 |      59.0531 |        0.5000 | 
   16 | 00m58s |    0.89512 |    10.3505 |      24.1579 |        0.5816 | 
   17 | 01m45s |    0.89539 |    10.0860 |      52.1601 |        0.5179 | 
   18 | 01m20s |    0.89874 |    79.7251 |      42.0294 |        0.5001 | 
   19 | 01m32s |    0.89882 |    68.2132 |      48.4853 |        0.5007 | 
   20 | 02m21s |    0.89971 |    44.7989 |      81.0207 |        0.5006 | 
   21 | 02m08s |    0.89888 |    66.4948 |      89.5209 |        0.5097 | 
   22 | 02m36s |    0.89955 |    47.6810 |      89.8902 |        0.5129 | 
   23 | 01m17s |    0.89745 |    23.4641 |      35.6618 |        0.5007 | 
   24 | 02m47s |    0.89800 |    25.2718 |      89.8462 |        0.5286 | 
   25 | 01m09s |    0.89851 |    65.2998 |      32.9200 |        0.5026 | 
   26 | 02m12s |    0.89972 |    48.3971 |      72.7748 |        0.5072 | 
   27 | 01m54s |    0.89896 |    79.7343 |      79.1709 |        0.5042 | 
   28 | 02m15s |    0.89918 |    38.1977 |      72.2468 |        0.5028 | 
   29 | 02m13s |    0.89984 |    52.5056 |      66.9870 |        0.5062 | 
   30 | 02m50s |    0.89972 |    55.5660 |      89.8500 |        0.5227 | 

```

- 调参 lightgbm, poly, selcet
```
Initialization
-------------------------------------------------------------------------
 Step |   Time |      Value |   min_data |   num_leaves |   sub_feature | 
    1 | 00m40s |    0.89308 |    13.3404 |      28.6552 |        0.8625 | 
    2 | 00m29s |    0.89322 |    35.3893 |      24.4548 |        0.7831 | 
    3 | 00m35s |    0.89400 |    36.2014 |      28.3563 |        0.7027 | 
    4 | 00m33s |    0.89282 |    13.3683 |      27.3606 |        0.8871 | 
    5 | 00m52s |    0.89451 |    18.4654 |      43.2735 |        0.8076 | 
Bayesian Optimization
-------------------------------------------------------------------------
 Step |   Time |      Value |   min_data |   num_leaves |   sub_feature | 
    6 | 01m06s |    0.89613 |    39.9638 |      44.6335 |        0.8855 | 
    7 | 00m57s |    0.89631 |    39.8309 |      44.5368 |        0.7056 | 
    8 | 00m54s |    0.89613 |    39.3875 |      44.0407 |        0.7544 | 
    9 | 00m51s |    0.89564 |    37.3923 |      42.4752 |        0.7568 | 
   10 | 00m50s |    0.89581 |    39.6587 |      42.6715 |        0.8246 | 
   11 | 00m48s |    0.89598 |    38.7796 |      44.2667 |        0.7478 | 
   12 | 00m56s |    0.89378 |    10.0284 |      44.7558 |        0.7462 | 
   13 | 00m36s |    0.89280 |    24.8175 |      24.8836 |        0.7038 | 
   14 | 00m48s |    0.89407 |    10.0190 |      38.1072 |        0.7009 | 
   15 | 00m48s |    0.89397 |    25.3234 |      36.8967 |        0.7078 | 
   16 | 00m52s |    0.89263 |    13.4254 |      40.2197 |        0.9927 | 
   17 | 00m37s |    0.89239 |    10.0513 |      24.5045 |        0.7022 | 
   18 | 00m55s |    0.89484 |    25.9201 |      44.6396 |        0.7071 | 
   19 | 00m55s |    0.89591 |    39.0573 |      44.9935 |        0.7889 | 
   20 | 00m54s |    0.89612 |    39.7714 |      44.4606 |        0.7217 | 
   21 | 00m38s |    0.89340 |    39.9621 |      24.0102 |        0.9469 | 
   22 | 00m46s |    0.89308 |    28.4030 |      30.5375 |        0.9986 | 
   23 | 00m44s |    0.89419 |    20.4802 |      31.7276 |        0.7002 | 
   24 | 00m38s |    0.89347 |    18.3571 |      24.0041 |        0.9259 | 
   25 | 00m46s |    0.89444 |    39.9959 |      32.5275 |        0.9495 | 
   26 | 00m45s |    0.89213 |    10.0429 |      31.3136 |        0.9895 | 
   27 | 00m49s |    0.89478 |    34.7258 |      34.5959 |        0.9893 | 
   28 | 00m53s |    0.89364 |    19.8283 |      38.0799 |        0.9995 | 
   29 | 00m59s |    0.89446 |    21.6134 |      44.9385 |        0.9746 | 
   30 | 00m43s |    0.89295 |    30.2431 |      24.0159 |        0.9861 | 
```

- 调参, xgboost 没有 Poly, 没有 select
```
Initialization
---------------------------------------------------------------------------------------------------------------------------
 Step |   Time |      Value |     alpha |   colsample_bytree |     gamma |   max_depth |   min_child_weight |   subsample | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[197]   train-rmse:0.195878+0.0123012   test-rmse:0.208239+0.0411462

    1 | 00m32s |    0.82765 |    5.7627 |             0.8816 |    8.9251 |      8.9170 |             4.7818 |      0.9867 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[687]   train-rmse:0.207072+0.0112054   test-rmse:0.217101+0.04095

    2 | 00m50s |    0.82162 |    4.8094 |             0.1524 |    8.9623 |      8.3710 |            14.4551 |      0.5066 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[517]   train-rmse:0.170178+0.00801758  test-rmse:0.198004+0.0431674

    3 | 00m39s |    0.83472 |    0.4197 |             0.9760 |    6.6583 |      7.2004 |             5.4405 |      0.9482 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[320]   train-rmse:0.161837+0.00514652  test-rmse:0.192605+0.0449452

    4 | 00m36s |    0.83850 |    2.5045 |             0.1081 |    3.5627 |      8.6096 |             5.3034 |      0.6467 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[184]   train-rmse:0.173951+0.0114196   test-rmse:0.192101+0.0452325

    5 | 00m19s |    0.83886 |    3.6557 |             0.6611 |    3.0679 |      6.6067 |            11.0217 |      0.9738 | 
Bayesian Optimization
---------------------------------------------------------------------------------------------------------------------------
 Step |   Time |      Value |     alpha |   colsample_bytree |     gamma |   max_depth |   min_child_weight |   subsample | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
    6 | 02m15s |    0.85795 |    3.5250 |             0.1000 |    0.0000 |      5.0000 |             1.0000 |      0.5000 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[705]   train-rmse:0.129911+0.00912712  test-rmse:0.174405+0.0491092

    7 | 00m53s |    0.85149 |    4.5394 |             0.1479 |    0.3080 |      5.0616 |             1.1630 |      0.9808 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
    8 | 02m17s |    0.85608 |    6.3486 |             1.0000 |    0.0000 |      7.5308 |             1.0000 |      0.5000 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
    9 | 01m48s |    0.85490 |    9.8434 |             0.8231 |    0.0005 |      5.5694 |             6.4337 |      0.5224 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[3126]  train-rmse:0.0422348+0.000278813    test-rmse:0.16515+0.0491297

   10 | 02m46s |    0.85826 |    0.0510 |             0.9448 |    0.0337 |      5.6027 |             1.3594 |      0.6475 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[199]   train-rmse:0.128815+0.0100083   test-rmse:0.173515+0.0480872

   11 | 00m33s |    0.85214 |    0.0331 |             0.9427 |    0.2055 |      5.1030 |            19.9231 |      0.6140 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[1047]  train-rmse:0.0724704+0.0021714  test-rmse:0.171042+0.0471892

   12 | 01m06s |    0.85394 |    0.8745 |             0.9053 |    0.0558 |      5.0156 |             6.9965 |      0.5406 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[3578]  train-rmse:0.170735+0.0112051   test-rmse:0.187734+0.0459285

   13 | 03m04s |    0.84194 |    9.7164 |             0.8969 |    0.4162 |      6.5264 |            19.4779 |      0.5282 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[419]   train-rmse:0.200553+0.012885    test-rmse:0.209911+0.0411614

   14 | 00m43s |    0.82651 |    9.9491 |             0.8798 |    4.9627 |      5.3788 |             1.5445 |      0.5638 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[624]   train-rmse:0.105632+0.00435478  test-rmse:0.172776+0.0485723

   15 | 01m12s |    0.85268 |    2.3135 |             0.9080 |    0.1369 |      8.7489 |            19.6588 |      0.5930 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[2539]  train-rmse:0.156962+0.0114113   test-rmse:0.180044+0.0489546

   16 | 02m45s |    0.84743 |    9.7231 |             0.9347 |    0.1838 |      8.9306 |             8.7318 |      0.6074 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[1369]  train-rmse:0.0148022+0.000132655    test-rmse:0.164526+0.0493331

   17 | 01m53s |    0.85872 |    0.3320 |             1.0000 |    0.0000 |      8.1248 |             1.0000 |      0.5000 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
   18 | 02m39s |    0.85675 |    3.5643 |             0.9506 |    0.0023 |      5.7774 |             1.6198 |      0.5875 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[1513]  train-rmse:0.101436+0.0047481   test-rmse:0.169259+0.0495821

   19 | 01m17s |    0.85524 |    5.2489 |             0.4847 |    0.0103 |      5.1406 |            15.3746 |      0.5715 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[88]    train-rmse:0.127899+0.0125588   test-rmse:0.172174+0.0480565

   20 | 00m37s |    0.85312 |    0.0642 |             0.9378 |    0.0827 |      8.2028 |            16.0992 |      0.5952 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[2121]  train-rmse:0.0646002+0.000832822    test-rmse:0.171847+0.0484836

   21 | 01m45s |    0.85335 |    0.2902 |             0.3515 |    0.0953 |      5.2408 |             1.1139 |      0.5488 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[687]   train-rmse:0.200055+0.0109885   test-rmse:0.210511+0.0413763

   22 | 01m21s |    0.82610 |    0.0192 |             0.8362 |    9.9901 |      8.8984 |            19.6094 |      0.5883 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[1424]  train-rmse:0.16861+0.00461573   test-rmse:0.207266+0.0414517

   23 | 02m15s |    0.82832 |    0.0844 |             0.1037 |    9.9200 |      8.8899 |             1.3355 |      0.6070 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
   24 | 02m06s |    0.85228 |    9.5270 |             0.2431 |    0.0244 |      5.7202 |             2.1252 |      0.5160 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[687]   train-rmse:0.210007+0.0116002   test-rmse:0.218094+0.0400369

   25 | 00m52s |    0.82095 |    9.8169 |             0.7213 |    9.9785 |      5.4211 |            19.8309 |      0.5940 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
   26 | 02m42s |    0.84623 |    9.7544 |             0.2082 |    0.3114 |      5.0139 |            13.8164 |      0.7186 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[446]   train-rmse:0.21087+0.0117543    test-rmse:0.219739+0.0394463

   27 | 00m55s |    0.81985 |    9.9749 |             0.8118 |    8.9516 |      8.9543 |            19.7698 |      0.5328 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[815]   train-rmse:0.140624+0.00580976  test-rmse:0.179822+0.0480236

   28 | 00m59s |    0.84759 |    4.8207 |             0.9968 |    0.2786 |      5.1710 |            19.7806 |      0.5094 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[3180]  train-rmse:0.0872186+0.00316177 test-rmse:0.169184+0.0500056

   29 | 02m15s |    0.85530 |    5.2867 |             0.9557 |    0.0045 |      7.4639 |            10.5230 |      0.5148 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 200 rounds.
Stopping. Best iteration:
[3154]  train-rmse:0.119775+0.006007    test-rmse:0.172512+0.0482084

   30 | 03m28s |    0.85287 |    6.3793 |             0.1365 |    0.0537 |      8.8765 |            19.8939 |      0.7570 | 
```

- 贝叶斯算法调参, xgboost 修改 lambda, 然后让 max_depth 为 int(round(max_depth))
```
Initialization
---------------------------------------------------------------------------------------------------------------------------
 Step |   Time |      Value |     alpha |   colsample_bytree |     gamma |   max_depth |   min_child_weight |   subsample | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[504]   train-rmse:0.190752+0.0115466   test-rmse:0.202386+0.0441577

    1 | 01m33s |    0.83168 |    2.2423 |             0.2760 |    8.3163 |      7.9819 |            11.9493 |      0.5422 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[429]   train-rmse:0.18102+0.0135356    test-rmse:0.192676+0.0462058

    2 | 01m25s |    0.83845 |    8.3147 |             0.5970 |    3.0178 |      8.1010 |            15.8100 |      0.7053 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[951]   train-rmse:0.156348+0.00653755  test-rmse:0.183278+0.0496832

    3 | 01m43s |    0.84511 |    1.4009 |             0.7313 |    2.6497 |      6.2952 |            11.1243 |      0.5814 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[338]   train-rmse:0.161533+0.0111091   test-rmse:0.184395+0.0469676

    4 | 00m58s |    0.84431 |    6.2023 |             0.4607 |    1.9572 |      6.0003 |             3.6061 |      0.9935 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[199]   train-rmse:0.199102+0.0123887   test-rmse:0.211266+0.0413313

    5 | 00m32s |    0.82558 |    6.0086 |             0.3540 |    9.9604 |      6.1448 |            18.3724 |      0.5751 | 
Bayesian Optimization
---------------------------------------------------------------------------------------------------------------------------
 Step |   Time |      Value |     alpha |   colsample_bytree |     gamma |   max_depth |   min_child_weight |   subsample | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[1097]  train-rmse:0.0576316+0.000875329    test-rmse:0.163386+0.0510111

    6 | 02m03s |    0.85956 |    0.2286 |             0.1583 |    0.0736 |      5.1283 |             1.7963 |      0.6243 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[66]    train-rmse:0.0623832+0.00534167 test-rmse:0.166937+0.0500796

    7 | 00m44s |    0.85694 |    0.0000 |             0.1000 |    0.0000 |      8.9900 |             1.0000 |      0.5000 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[128]   train-rmse:0.105282+0.00847476  test-rmse:0.165751+0.0515399

    8 | 00m55s |    0.85782 |    0.0789 |             0.1127 |    0.2135 |      6.8377 |            18.7572 |      0.9610 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[549]   train-rmse:0.0853878+0.00429791 test-rmse:0.165532+0.0492804

    9 | 01m12s |    0.85798 |    1.0575 |             0.1289 |    0.0490 |      5.1182 |            11.4168 |      0.5068 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[475]   train-rmse:0.105695+0.00688005  test-rmse:0.163675+0.0497027

   10 | 01m08s |    0.85935 |    2.8001 |             0.1294 |    0.0399 |      5.0029 |            19.4778 |      0.5357 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[136]   train-rmse:0.118534+0.0127688   test-rmse:0.16232+0.0521042

   11 | 00m46s |    0.86035 |    0.2093 |             0.2543 |    0.0180 |      6.1172 |            19.2916 |      0.5728 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[184]   train-rmse:0.110817+0.0111508   test-rmse:0.161417+0.0512645

   12 | 00m50s |    0.86102 |    0.2264 |             0.1635 |    0.0172 |      5.6864 |            18.6665 |      0.5565 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[248]   train-rmse:0.12099+0.0107293    test-rmse:0.164323+0.049502

   13 | 00m50s |    0.85887 |    1.5715 |             0.1284 |    0.0759 |      5.0458 |            19.9576 |      0.5327 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[349]   train-rmse:0.188724+0.00980504  test-rmse:0.206357+0.0420791

   14 | 01m07s |    0.82894 |    9.7689 |             0.2142 |    9.5737 |      5.1862 |             1.1704 |      0.8332 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[1238]  train-rmse:0.161453+0.0122062   test-rmse:0.182954+0.0487308

   15 | 02m14s |    0.84534 |    9.3541 |             0.2254 |    0.6272 |      5.0375 |             1.2388 |      0.5884 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
   16 | 03m39s |    0.86120 |    9.8908 |             0.9780 |    0.0046 |      5.1699 |            19.1808 |      0.7930 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[429]   train-rmse:0.17305+0.00374379   test-rmse:0.202608+0.0452849

   17 | 01m23s |    0.83153 |    0.4851 |             0.9887 |    9.6461 |      5.6444 |             1.3138 |      0.5317 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[1002]  train-rmse:0.0630216+0.00150687 test-rmse:0.16262+0.0503786

   18 | 02m02s |    0.86013 |    0.7498 |             0.9767 |    0.0391 |      5.4001 |            17.7754 |      0.7405 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
   19 | 04m12s |    0.85690 |    9.9133 |             0.6180 |    0.0356 |      5.1379 |            13.8195 |      0.5561 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[659]   train-rmse:0.0736246+0.00120157 test-rmse:0.163565+0.0532027

   20 | 01m33s |    0.85943 |    0.2129 |             0.9047 |    0.1971 |      5.4022 |             1.4547 |      0.8380 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[85]    train-rmse:0.113835+0.0126973   test-rmse:0.161434+0.0520969

   21 | 00m51s |    0.86100 |    0.0703 |             0.9859 |    0.0644 |      8.3846 |            14.0914 |      0.6521 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[3255]  train-rmse:0.153926+0.0128447   test-rmse:0.172472+0.0494694

   22 | 04m54s |    0.85290 |    9.9299 |             0.2887 |    0.1763 |      5.1152 |            19.5629 |      0.6623 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
   23 | 07m13s |    0.85710 |    9.5123 |             0.9060 |    0.0379 |      8.9608 |             1.1504 |      0.7286 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
   24 | 06m41s |    0.85612 |    9.5409 |             0.8510 |    0.0520 |      8.7523 |            17.7151 |      0.5888 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[1933]  train-rmse:0.0803088+0.00238692 test-rmse:0.163612+0.0530145

   25 | 04m19s |    0.85939 |    3.0201 |             0.9549 |    0.0370 |      6.2640 |             1.2210 |      0.6456 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[3552]  train-rmse:0.128893+0.00845585  test-rmse:0.16733+0.0505358

   26 | 05m40s |    0.85666 |    8.7669 |             0.9227 |    0.0367 |      8.4645 |             8.0142 |      0.5478 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[136]   train-rmse:0.089546+0.00833723  test-rmse:0.162234+0.0503046

   27 | 00m58s |    0.86041 |    0.4741 |             0.8875 |    0.0045 |      8.2768 |             7.4282 |      0.5455 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[2580]  train-rmse:0.128659+0.00709327  test-rmse:0.168235+0.0493959

   28 | 04m16s |    0.85599 |    7.2997 |             0.9662 |    0.0699 |      6.6019 |            16.7450 |      0.5136 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[199]   train-rmse:0.205853+0.0116411   test-rmse:0.217438+0.0417062

   29 | 01m04s |    0.82140 |    9.9760 |             0.7835 |    9.8966 |      8.8223 |             9.0569 |      0.5120 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[717]   train-rmse:0.18859+0.0123499    test-rmse:0.200365+0.0444708

   30 | 02m27s |    0.83308 |    0.2900 |             0.7331 |    8.1912 |      8.9828 |            19.9260 |      0.5700 | 
```

- 贝叶斯算法调参, xgboost round=1
```
Initialization
---------------------------------------------------------------------------------------------------------------------------
 Step |   Time |      Value |     alpha |   colsample_bytree |     gamma |   max_depth |   min_child_weight |   subsample | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[1130]  train-rmse:0.0867982+0.00244869 test-rmse:0.164544+0.0512479

    1 | 02m57s |    0.85870 |    1.9804 |             0.2714 |    0.1788 |      7.0724 |             2.3587 |      0.8775 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[1052]  train-rmse:0.157715+0.0101339   test-rmse:0.181214+0.048685

    2 | 02m27s |    0.84659 |    1.4282 |             0.3582 |    2.8980 |      7.2233 |            14.3053 |      0.8937 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[698]   train-rmse:0.151343+0.00507483  test-rmse:0.184357+0.0493823

    3 | 01m48s |    0.84434 |    0.0565 |             0.8577 |    4.8621 |      7.3516 |             6.4596 |      0.8973 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[295]   train-rmse:0.183956+0.0122023   test-rmse:0.198255+0.0451437

    4 | 01m09s |    0.83455 |    3.2160 |             0.3914 |    6.9224 |      9.4511 |            11.9270 |      0.7225 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[195]   train-rmse:0.185242+0.0129461   test-rmse:0.199286+0.0437828

    5 | 00m37s |    0.83383 |    4.3535 |             0.8354 |    8.3440 |      5.3507 |            13.1633 |      0.9448 | 
Bayesian Optimization
---------------------------------------------------------------------------------------------------------------------------
 Step |   Time |      Value |     alpha |   colsample_bytree |     gamma |   max_depth |   min_child_weight |   subsample | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[2748]  train-rmse:0.152033+0.0125191   test-rmse:0.176945+0.0489888

    6 | 04m03s |    0.84966 |    9.0721 |             0.9062 |    0.2869 |      5.4337 |             1.1875 |      0.5813 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[1724]  train-rmse:0.0593024+0.000739669    test-rmse:0.169514+0.047778

    7 | 03m04s |    0.85506 |    0.0000 |             0.1649 |    0.0998 |      5.0909 |             1.0000 |      0.5000 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[142]   train-rmse:0.159405+0.0141507   test-rmse:0.178816+0.0477511

    8 | 01m17s |    0.84831 |   10.0000 |             1.0000 |    0.4701 |     15.0000 |            20.0000 |      1.0000 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[2030]  train-rmse:0.039866+0.000466513 test-rmse:0.160983+0.0531645

    9 | 13m07s |    0.86134 |    0.5549 |             0.9969 |    0.0182 |     14.7062 |             1.1959 |      0.8917 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[1780]  train-rmse:0.14006+0.0115138    test-rmse:0.171707+0.0511319

   10 | 08m27s |    0.85346 |    9.8362 |             0.5089 |    0.1652 |     14.4781 |             1.1817 |      0.8901 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[2496]  train-rmse:0.144685+0.0136754   test-rmse:0.168362+0.0512057

   11 | 04m56s |    0.85590 |    9.9721 |             0.2910 |    0.0775 |      5.6398 |            18.0978 |      0.9463 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[822]   train-rmse:0.0861436+0.000792746    test-rmse:0.167643+0.0522578

   12 | 06m30s |    0.85643 |    0.9320 |             0.1359 |    0.3337 |     14.2406 |             2.6550 |      0.9984 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[482]   train-rmse:0.128418+0.00712315  test-rmse:0.168481+0.0503365

   13 | 01m47s |    0.85581 |    6.1327 |             0.9855 |    0.1009 |      8.8341 |             9.5384 |      0.5992 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[3686]  train-rmse:0.0662846+0.00109199 test-rmse:0.164686+0.052332

   14 | 08m17s |    0.85860 |    0.0788 |             0.8114 |    0.1852 |      6.2363 |             1.1639 |      0.9685 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[216]   train-rmse:0.129563+0.0112442   test-rmse:0.167904+0.0499063

   15 | 00m57s |    0.85623 |    1.9699 |             0.6657 |    0.1147 |      5.3482 |            19.9536 |      0.5076 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[1275]  train-rmse:0.095057+0.00283716  test-rmse:0.170377+0.0486338

   16 | 04m23s |    0.85443 |    2.5510 |             0.7704 |    0.1636 |     10.3840 |             1.0001 |      0.5251 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[195]   train-rmse:0.185846+0.0095711   test-rmse:0.205026+0.0423622

   17 | 01m54s |    0.82986 |    7.6490 |             0.9048 |    9.9473 |     14.6622 |             1.5906 |      0.9198 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[1362]  train-rmse:0.0966226+0.00296674 test-rmse:0.167007+0.0507723

   18 | 02m53s |    0.85689 |    1.5803 |             0.8907 |    0.2452 |      5.2793 |             7.7143 |      0.9670 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[128]   train-rmse:0.104155+0.00989378  test-rmse:0.161751+0.0530554

   19 | 01m32s |    0.86077 |    1.3774 |             0.8725 |    0.0558 |     14.8217 |            19.6573 |      0.9844 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[3508]  train-rmse:0.101171+0.00610721  test-rmse:0.162294+0.0510992

   20 | 04m21s |    0.86037 |    5.8900 |             0.9912 |    0.0106 |      8.7800 |            19.3086 |      0.9789 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[1239]  train-rmse:0.0758958+0.00204192 test-rmse:0.162114+0.051223

   21 | 04m17s |    0.86050 |    3.6920 |             0.6163 |    0.0091 |     14.9832 |            13.2656 |      0.9697 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[2843]  train-rmse:0.108998+0.00821283  test-rmse:0.161778+0.0515579

   22 | 03m01s |    0.86075 |    6.1702 |             0.1080 |    0.0112 |      5.0252 |            12.8282 |      0.9823 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[1047]  train-rmse:0.109109+0.00639273  test-rmse:0.167631+0.0509857

   23 | 04m46s |    0.85643 |    5.2308 |             0.9766 |    0.0822 |     14.7460 |             5.7468 |      0.9069 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[87]    train-rmse:0.0982738+0.0115735  test-rmse:0.161821+0.0528895

   24 | 01m01s |    0.86072 |    0.2275 |             0.1814 |    0.0291 |     10.3251 |            17.4313 |      0.9946 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[555]   train-rmse:0.162867+0.00777645  test-rmse:0.195321+0.0443348

   25 | 01m28s |    0.83660 |    0.1054 |             0.1367 |    9.4753 |      5.5170 |             1.0464 |      0.8978 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[557]   train-rmse:0.122396+0.0084504   test-rmse:0.166493+0.0503205

   26 | 02m12s |    0.85727 |    6.1462 |             0.2019 |    0.0635 |      9.7691 |            19.7947 |      0.9653 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[81]    train-rmse:0.0931764+0.0111072  test-rmse:0.162961+0.0525167

   27 | 01m21s |    0.85987 |    0.4258 |             0.9876 |    0.0213 |     14.6771 |            13.2344 |      0.9836 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[2243]  train-rmse:0.137674+0.0123105   test-rmse:0.168431+0.0503604

   28 | 07m35s |    0.85585 |    8.8225 |             0.8207 |    0.0797 |     13.3997 |            12.0870 |      0.9611 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[279]   train-rmse:0.0884066+0.00521016 test-rmse:0.162029+0.0516984

   29 | 01m42s |    0.86056 |    2.4328 |             0.9322 |    0.0307 |     10.8009 |            16.7335 |      0.9652 | 
Multiple eval metrics have been passed: 'test-rmse' will be used for early stopping.

Will train until test-rmse hasn't improved in 150 rounds.
Stopping. Best iteration:
[1346]  train-rmse:0.0768978+0.00311061 test-rmse:0.160105+0.0521845

   30 | 02m31s |    0.86199 |    3.1606 |             0.4358 |    0.0084 |      5.3738 |            19.6339 |      0.9666 | 
```