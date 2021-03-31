select
	invTypes.typeID,
    industryActivity.activityID,
    industryActivityMaterials.materialTypeID,
    industryActivityMaterials.quantity,
    industryActivity.time
from 
	industryBlueprints
left join
	invTypes on invTypes.typeID = industryBlueprints.typeID
left join
	industryActivity on industryActivity.typeID = industryBlueprints.typeID and industryActivity.activityID = 8
left join
	industryActivityMaterials on industryActivityMaterials.typeID = industryBlueprints.typeID and industryActivityMaterials.activityID = 8
where industryActivity.activityID = 8