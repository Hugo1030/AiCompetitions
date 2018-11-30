/*
* @Author: Hugo1030
* @Date:   2018-03-04
* @Last Modified by:   Hugo1030
* @Last Modified time: 2018-03-04
*/

-- feature_1_nhttps://ide-cn-shanghai.data.aliyun.com/umerical
-- DONE: LiChuan 18.3.3
-- <= ycc_sales_dama0303_dclean_14_kill_chaos_fields
-- => ycc_sales_dama0303_feature_0_onehot
-- => Size: 63520 
-- du4ai / TianChi / issues / #4 - [TASK] 基础类别特征进行 one-hot 及 数值编码 — Bitbucket 
--    https://bitbucket.org/du4ai/tianchi/issues/4/task-one-hot
--    
-- 对类别型特征进行 one-hot 编码, 该类型特征有:
-- brand_id, compartment, type_id, level_id, department_id, tr, gearbox_type
-- if_charging, driven_type_id, fuel_type_id
-- newenergy_type_id, emission_standards_id if_mpv_id, if_luxurious_id
-- cylinder_number
-- 
-- 
-- ycc_sales_dama0303_dclean_14_kill_chaos_fields 在此文件上进行处理

drop table if exists ycc_sales_lichuan0303_feature_0_onehot;
create table ycc_sales_lichuan0303_feature_0_onehot as
        select class_id,
            case when brand_id=15 then 1.0 else 0.0 end as brand_id_15,
            case when brand_id=18 then 1.0 else 0.0 end as brand_id_18,
            case when brand_id=21 then 1.0 else 0.0 end as brand_id_21,
            case when brand_id=27 then 1.0 else 0.0 end as brand_id_27,
            case when brand_id=30 then 1.0 else 0.0 end as brand_id_30,
            case when brand_id=36 then 1.0 else 0.0 end as brand_id_36,
            case when brand_id=39 then 1.0 else 0.0 end as brand_id_39,
            case when brand_id=42 then 1.0 else 0.0 end as brand_id_42,
            case when brand_id=48 then 1.0 else 0.0 end as brand_id_48,
            case when brand_id=57 then 1.0 else 0.0 end as brand_id_57,
            case when brand_id=60 then 1.0 else 0.0 end as brand_id_60,
            case when brand_id=63 then 1.0 else 0.0 end as brand_id_63,
            case when brand_id=66 then 1.0 else 0.0 end as brand_id_66,
            case when brand_id=69 then 1.0 else 0.0 end as brand_id_69,
            case when brand_id=84 then 1.0 else 0.0 end as brand_id_84,
            case when brand_id=99 then 1.0 else 0.0 end as brand_id_99,
            case when brand_id=102 then 1.0 else 0.0 end as brand_id_102,
            case when brand_id=108 then 1.0 else 0.0 end as brand_id_108,
            case when brand_id=117 then 1.0 else 0.0 end as brand_id_117,
            case when brand_id=123 then 1.0 else 0.0 end as brand_id_123,
            case when brand_id=126 then 1.0 else 0.0 end as brand_id_126,
            case when brand_id=129 then 1.0 else 0.0 end as brand_id_129,
            case when brand_id=132 then 1.0 else 0.0 end as brand_id_132,
            case when brand_id=135 then 1.0 else 0.0 end as brand_id_135,
            case when brand_id=138 then 1.0 else 0.0 end as brand_id_138,
            case when brand_id=141 then 1.0 else 0.0 end as brand_id_141,
            case when brand_id=165 then 1.0 else 0.0 end as brand_id_165,
            case when brand_id=225 then 1.0 else 0.0 end as brand_id_225,
            case when brand_id=237 then 1.0 else 0.0 end as brand_id_237,
            case when brand_id=10 then 1.0 else 0.0 end as brand_id_10,
            case when brand_id=13 then 1.0 else 0.0 end as brand_id_13,
            case when brand_id=16 then 1.0 else 0.0 end as brand_id_16,
            case when brand_id=22 then 1.0 else 0.0 end as brand_id_22,
            case when brand_id=25 then 1.0 else 0.0 end as brand_id_25,
            case when brand_id=28 then 1.0 else 0.0 end as brand_id_28,
            case when brand_id=31 then 1.0 else 0.0 end as brand_id_31,
            case when brand_id=34 then 1.0 else 0.0 end as brand_id_34,
            case when brand_id=37 then 1.0 else 0.0 end as brand_id_37,
            case when brand_id=43 then 1.0 else 0.0 end as brand_id_43,
            case when brand_id=46 then 1.0 else 0.0 end as brand_id_46,
            case when brand_id=49 then 1.0 else 0.0 end as brand_id_49,
            case when brand_id=52 then 1.0 else 0.0 end as brand_id_52,
            case when brand_id=55 then 1.0 else 0.0 end as brand_id_55,
            case when brand_id=58 then 1.0 else 0.0 end as brand_id_58,
            case when brand_id=67 then 1.0 else 0.0 end as brand_id_67,
            case when brand_id=79 then 1.0 else 0.0 end as brand_id_79,
            case when brand_id=82 then 1.0 else 0.0 end as brand_id_82,
            case when brand_id=91 then 1.0 else 0.0 end as brand_id_91,
            case when brand_id=94 then 1.0 else 0.0 end as brand_id_94,
            case when brand_id=100 then 1.0 else 0.0 end as brand_id_100,
            case when brand_id=103 then 1.0 else 0.0 end as brand_id_103,
            case when brand_id=109 then 1.0 else 0.0 end as brand_id_109,
            case when brand_id=121 then 1.0 else 0.0 end as brand_id_121,
            case when brand_id=127 then 1.0 else 0.0 end as brand_id_127,
            case when brand_id=130 then 1.0 else 0.0 end as brand_id_130,
            case when brand_id=133 then 1.0 else 0.0 end as brand_id_133,
            case when brand_id=139 then 1.0 else 0.0 end as brand_id_139,
            case when brand_id=142 then 1.0 else 0.0 end as brand_id_142,
            case when brand_id=145 then 1.0 else 0.0 end as brand_id_145,
            case when brand_id=187 then 1.0 else 0.0 end as brand_id_187,
            case when brand_id=223 then 1.0 else 0.0 end as brand_id_223,
            case when brand_id=229 then 1.0 else 0.0 end as brand_id_229,
            case when brand_id=232 then 1.0 else 0.0 end as brand_id_232,
            case when brand_id=235 then 1.0 else 0.0 end as brand_id_235,
            case when brand_id=238 then 1.0 else 0.0 end as brand_id_238,
            case when brand_id=2 then 1.0 else 0.0 end as brand_id_2,
            case when brand_id=8 then 1.0 else 0.0 end as brand_id_8,
            case when brand_id=11 then 1.0 else 0.0 end as brand_id_11,
            case when brand_id=14 then 1.0 else 0.0 end as brand_id_14,
            case when brand_id=17 then 1.0 else 0.0 end as brand_id_17,
            case when brand_id=23 then 1.0 else 0.0 end as brand_id_23,
            case when brand_id=29 then 1.0 else 0.0 end as brand_id_29,
            case when brand_id=32 then 1.0 else 0.0 end as brand_id_32,
            case when brand_id=35 then 1.0 else 0.0 end as brand_id_35,
            case when brand_id=38 then 1.0 else 0.0 end as brand_id_38,
            case when brand_id=41 then 1.0 else 0.0 end as brand_id_41,
            case when brand_id=47 then 1.0 else 0.0 end as brand_id_47,
            case when brand_id=50 then 1.0 else 0.0 end as brand_id_50,
            case when brand_id=53 then 1.0 else 0.0 end as brand_id_53,
            case when brand_id=56 then 1.0 else 0.0 end as brand_id_56,
            case when brand_id=59 then 1.0 else 0.0 end as brand_id_59,
            case when brand_id=65 then 1.0 else 0.0 end as brand_id_65,
            case when brand_id=68 then 1.0 else 0.0 end as brand_id_68,
            case when brand_id=77 then 1.0 else 0.0 end as brand_id_77,
            case when brand_id=80 then 1.0 else 0.0 end as brand_id_80,
            case when brand_id=83 then 1.0 else 0.0 end as brand_id_83,
            case when brand_id=86 then 1.0 else 0.0 end as brand_id_86,
            case when brand_id=95 then 1.0 else 0.0 end as brand_id_95,
            case when brand_id=98 then 1.0 else 0.0 end as brand_id_98,
            case when brand_id=101 then 1.0 else 0.0 end as brand_id_101,
            case when brand_id=104 then 1.0 else 0.0 end as brand_id_104,
            case when brand_id=110 then 1.0 else 0.0 end as brand_id_110,
            case when brand_id=122 then 1.0 else 0.0 end as brand_id_122,
            case when brand_id=125 then 1.0 else 0.0 end as brand_id_125,
            case when brand_id=134 then 1.0 else 0.0 end as brand_id_134,
            case when brand_id=137 then 1.0 else 0.0 end as brand_id_137,
            case when brand_id=140 then 1.0 else 0.0 end as brand_id_140,
            case when brand_id=143 then 1.0 else 0.0 end as brand_id_143,
            case when brand_id=173 then 1.0 else 0.0 end as brand_id_173,
            case when brand_id=185 then 1.0 else 0.0 end as brand_id_185,
            case when brand_id=200 then 1.0 else 0.0 end as brand_id_200,
            case when brand_id=209 then 1.0 else 0.0 end as brand_id_209,
            case when brand_id=221 then 1.0 else 0.0 end as brand_id_221,
            case when brand_id=227 then 1.0 else 0.0 end as brand_id_227,
            case when brand_id=230 then 1.0 else 0.0 end as brand_id_230,
            case when brand_id=233 then 1.0 else 0.0 end as brand_id_233,
            case when brand_id=236 then 1.0 else 0.0 end as brand_id_236,
            case when brand_id=239 then 1.0 else 0.0 end as brand_id_239,
            case when brand_id=245 then 1.0 else 0.0 end as brand_id_245,

            case when compartment=1 then 1.0 else 0.0 end as compartment_1,
            case when compartment=2 then 1.0 else 0.0 end as compartment_2,
            case when compartment=3 then 1.0 else 0.0 end as compartment_3,

            case when type_id=1 then 1.0 else 0.0 end as type_id_1,
            case when type_id=2 then 1.0 else 0.0 end as type_id_2,
            case when type_id=3 then 1.0 else 0.0 end as type_id_3,
            case when type_id=4 then 1.0 else 0.0 end as type_id_4,

            case when level_id=0 then 1.0 else 0.0 end as level_id_0,
            case when level_id=1 then 1.0 else 0.0 end as level_id_1,
            case when level_id=2 then 1.0 else 0.0 end as level_id_2,
            case when level_id=3 then 1.0 else 0.0 end as level_id_3,
            case when level_id=4 then 1.0 else 0.0 end as level_id_4,
            case when level_id=5 then 1.0 else 0.0 end as level_id_5,
            case when level_id=6 then 1.0 else 0.0 end as level_id_6,
            case when level_id=7 then 1.0 else 0.0 end as level_id_7,

            case when department_id=0 then 1.0 else 0.0 end as department_id_0,
            case when department_id=1 then 1.0 else 0.0 end as department_id_1,
            case when department_id=2 then 1.0 else 0.0 end as department_id_2,
            case when department_id=3 then 1.0 else 0.0 end as department_id_3,
            case when department_id=4 then 1.0 else 0.0 end as department_id_4,
            case when department_id=5 then 1.0 else 0.0 end as department_id_5,

            case when tr="0" then 1.0 else 0.0 end as tr_0,
            case when tr="1" then 1.0 else 0.0 end as tr_1,
            case when tr="1;2" then 1.0 else 0.0 end as tr_1_2,
            case when tr="2" then 1.0 else 0.0 end as tr_2,
            case when tr="4" then 1.0 else 0.0 end as tr_4,
            case when tr="4;5" then 1.0 else 0.0 end as tr_4_5,
            case when tr="4;6" then 1.0 else 0.0 end as tr_4_6,
            case when tr="5" then 1.0 else 0.0 end as tr_5,
            case when tr="5;0" then 1.0 else 0.0 end as tr_5_0,
            case when tr="5;4" then 1.0 else 0.0 end as tr_5_4,
            case when tr="5;6" then 1.0 else 0.0 end as tr_5_6,
            case when tr="5;7" then 1.0 else 0.0 end as tr_5_7,
            case when tr="6" then 1.0 else 0.0 end as tr_6,
            case when tr="6;0" then 1.0 else 0.0 end as tr_6_0,
            case when tr="6;7" then 1.0 else 0.0 end as tr_6_7,
            case when tr="7" then 1.0 else 0.0 end as tr_7,
            case when tr="8" then 1.0 else 0.0 end as tr_8,
            case when tr="8;0" then 1.0 else 0.0 end as tr_8_0,
            case when tr="8;7" then 1.0 else 0.0 end as tr_8_7,
            case when tr="9" then 1.0 else 0.0 end as tr_9,

            case when gearbox_type="AMT" then 1.0 else 0.0 end as gearbox_type_AMT,
            case when gearbox_type="AT" then 1.0 else 0.0 end as gearbox_type_AT,
            case when gearbox_type="AT;CVT" then 1.0 else 0.0 end as gearbox_type_AT_CVT,
            case when gearbox_type="AT;DCT" then 1.0 else 0.0 end as gearbox_type_AT_DCT,
            case when gearbox_type="CVT" then 1.0 else 0.0 end as gearbox_type_CVT,
            case when gearbox_type="DCT" then 1.0 else 0.0 end as gearbox_type_DCT,
            case when gearbox_type="MT" then 1.0 else 0.0 end as gearbox_type_MT,
            case when gearbox_type="MT;AMT" then 1.0 else 0.0 end as gearbox_type_MT_AMT,
            case when gearbox_type="MT;AT" then 1.0 else 0.0 end as gearbox_type_MT_AT,
            case when gearbox_type="MT;CVT" then 1.0 else 0.0 end as gearbox_type_MT_CVT,

            case when if_charging="L" then 1.0 else 0.0 end as if_charging_L,
            case when if_charging="T" then 1.0 else 0.0 end as if_charging_T,

            case when driven_type_id=0 then 1.0 else 0.0 end as driven_type_id_0,
            case when driven_type_id=1 then 1.0 else 0.0 end as driven_type_id_1,
            case when driven_type_id=2 then 1.0 else 0.0 end as driven_type_id_2,
            case when driven_type_id=3 then 1.0 else 0.0 end as driven_type_id_3,

            case when fuel_type_id=0 then 1.0 else 0.0 end as fuel_type_id_0,
            case when fuel_type_id=1 then 1.0 else 0.0 end as fuel_type_id_1,
            case when fuel_type_id=2 then 1.0 else 0.0 end as fuel_type_id_2,
            case when fuel_type_id=3 then 1.0 else 0.0 end as fuel_type_id_3,
            case when fuel_type_id=4 then 1.0 else 0.0 end as fuel_type_id_4,

            case when newenergy_type_id=0 then 1.0 else 0.0 end as newenergy_type_id_0,
            case when newenergy_type_id=1 then 1.0 else 0.0 end as newenergy_type_id_1,
            case when newenergy_type_id=2 then 1.0 else 0.0 end as newenergy_type_id_2,
            case when newenergy_type_id=3 then 1.0 else 0.0 end as newenergy_type_id_3,
            case when newenergy_type_id=4 then 1.0 else 0.0 end as newenergy_type_id_4,

            case when emission_standards_id=0 then 1.0 else 0.0 end as emission_standards_id_0,
            case when emission_standards_id=1 then 1.0 else 0.0 end as emission_standards_id_1,
            case when emission_standards_id=2 then 1.0 else 0.0 end as emission_standards_id_2,
            case when emission_standards_id=3 then 1.0 else 0.0 end as emission_standards_id_3,
            case when emission_standards_id=4 then 1.0 else 0.0 end as emission_standards_id_4,

            if_mpv_id,if_luxurious_id,

            case when cylinder_number=0 then 1.0 else 0.0 end as cylinder_number_0,
            case when cylinder_number=3 then 1.0 else 0.0 end as cylinder_number_3,
            case when cylinder_number=4 then 1.0 else 0.0 end as cylinder_number_4,
            case when cylinder_number=5 then 1.0 else 0.0 end as cylinder_number_5,
            case when cylinder_number=6 then 1.0 else 0.0 end as cylinder_number_6,
            case when cylinder_number=8 then 1.0 else 0.0 end as cylinder_number_8,
            case when cylinder_number=12 then 1.0 else 0.0 end as cylinder_number_12        
        from ycc_sales_dama0303_dclean_14_kill_chaos_fields
        
GROUP BY        class_id,brand_id,compartment,type_id,level_id,department_id
                ,tr,gearbox_type,if_charging,driven_type_id,fuel_type_id
                ,newenergy_type_id,emission_standards_id,if_mpv_id
                ,if_luxurious_id,cylinder_number
DISTRIBUTE BY   class_id
SORT BY         class_id
;