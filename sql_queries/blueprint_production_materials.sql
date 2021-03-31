select 
	# for full column list see the blueprint_production_marketgroups query file
    invTypes.typeID AS typeID,
    invMaterialTypes.typeName as meterialTypeName,
    invMaterialTypes.typeID as meterialTypeID,
    #industryActivityMaterials.*,
    #industryActivityMaterials.typeID,
    #industryActivityMaterials.activityID,
    #industryActivityMaterials.materialTypeID,
    industryActivityMaterials.quantity AS materialQuantity
from industryBlueprints 
left join invTypes on invTypes.typeID = industryBlueprints.typeID 
left join industryActivityMaterials on industryActivityMaterials.typeID = industryBlueprints.typeID and industryActivityMaterials.activityID = 1
left join invTypes invMaterialTypes on invMaterialTypes.typeID = industryActivityMaterials.materialTypeID 
# filter for published
where invTypes.published = 1