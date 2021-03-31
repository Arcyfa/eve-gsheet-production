select 
	# for full column list see the blueprint_production_marketgroups query file
    invTypes.typeID AS typeID,
    #industryActivityMaterials.*,
    #industryActivityMaterials.typeID,
    #industryActivityMaterials.activityID,
    industryActivityMaterials.materialTypeID,
    industryActivityMaterials.quantity AS materialQuantity
from industryBlueprints 
left join invTypes on invTypes.typeID = industryBlueprints.typeID 
left join industryActivityMaterials on industryActivityMaterials.typeID = industryBlueprints.typeID and industryActivityMaterials.activityID = 1
# filter for published
where invTypes.published = 1