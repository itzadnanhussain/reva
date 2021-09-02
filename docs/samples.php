<?php

///Joins
// $tableSelect = "tb1.*, tb2.name as camp_name, tb3.name as teach_name, tb4.name as sub_name, tb5.name as class_name, tb6.type as diary_type, tb6.*";
// $tableInfo = "diary tb1, compus tb2-tb2.id=tb1.camp_id-left, staff tb3-tb3.id=tb1.teach_id-left, subject tb4-tb4.id=tb1.sub_id-left, class tb5-tb5.id=tb1.class_id-left, diary_item tb6-tb6.diary_id=tb1.diary_id-left";
// $data['recs'] = getByWhere($tableInfo, $tableSelect, array('tb1.diary_id' => $diary_id));
 

///Active get deals
//  $tableSelect = "tb1.*, tb2.*, tb3.*, tb4.*";
//  $tableInfo = "deal tb1, deal_activity tb2-tb2.deal_id=tb1.deal_id-left, deal_invite_members tb3-tb3.deal_id=tb1.deal_id-left, deal_timeline_tasks tb4-tb4.deal_id=tb1.deal_id-left";  
//  $data['active_deals'] = getByWhere($tableInfo, $tableSelect, array('tb1.user_id' => $_SESSION['user_id'],'tb1.status' =>'active'));
 

////Inactive get deals
//  $tableSelect = "tb1.*, tb2.*, tb3.*, tb4.*";
//  $tableInfo = "deal tb1, deal_activity tb2-tb2.deal_id=tb1.deal_id-left, deal_invite_members tb3-tb3.deal_id=tb1.deal_id-left, deal_timeline_tasks tb4-tb4.deal_id=tb1.deal_id-left";  
//  $data['inactive_deals'] = getByWhere($tableInfo, $tableSelect, array('tb1.user_id' => $_SESSION['user_id'],'tb1.status' =>'inactive'));
 