select 
	#invTypes.typeName,
	invTypes.typeID, 
    #invGroups.groupName, 
    industryBlueprints.maxProductionLimit,
    invTypes.basePrice, 
    invTypes.published, 
    industryActivity.time AS buildTime, 
    industryActivityProducts.quantity AS outputQuantity,
    #invTypesProduct.typeName AS productName,
    invTypesProduct.typeID AS productID,
    productGroup4.marketGroupName AS productGroup4Name,
    productGroup3.marketGroupName AS productGroup3Name, 
    productGroup2.marketGroupName AS productGroup2Name,
	productGroup1.marketGroupName AS productGroup1Name,
    productGroup0.marketGroupName AS productGroup0Name

##
# For future reference all columns written fully
## 
	#industryBlueprints.*, 
	#industryBlueprints.typeID, 
    #industryBlueprints.maxProductionLimit, 
    
    #invTypes.*, 
    #invTypes.typeID, 
    #invTypes.groupID, 
    #invTypes.typeName, 
    #invTypes.description, 
    #invTypes.mass, 
    #invTypes.volume, 
    #invTypes.capacity, 
    #invTypes.portionSize, 
    #invTypes.raceID, 
    #invTypes.basePrice, 
    #invTypes.published, 
    #invTypes.marketGroupID, 
    #invTypes.iconID, 
    #invTypes.soundID, 
    #invTypes.graphicID, 
    
    #invGroups.*, 
    #invGroups.groupID, 
    #invGroups.groupName, 
    #invGroups.iconID AS groupIconID, 
    #invGroups.useBasePrice, 
    #invGroups.anchored, 
    #invGroups.anchorable, 
    #invGroups.fittableNonSingleton, 
    #invGroups.published AS groupdPublished, 
    
    #industryActivity.*, 
    #industryActivity.time AS buildTime, 
    
    #industryActivityProducts.*, 
    #industryActivityProducts.typeID, 
    #industryActivityProducts.activityID, 
    #industryActivityProducts.productTypeID, 
    #industryActivityProducts.quantity AS outputQuantity, 
    
    #invTypesProduct.*, 
	#invTypesProduct.typeID AS productID, 
    #invTypesProduct.groupID AS productGroupID, 
    #invTypesProduct.typeName AS productName, 
    #invTypesProduct.description AS productDescription, 
    #invTypesProduct.mass AS productMass, 
    #invTypesProduct.volume AS productVolume, 
    #invTypesProduct.capacity AS productCapacity, 
    #invTypesProduct.portionSize AS productPortionSize, 
    #invTypesProduct.raceID AS productRaceID, 
    #invTypesProduct.basePrice AS productBasePrice, 
    #invTypesProduct.published AS productPublished, 
    #invTypesProduct.marketGroupID AS productMarketGroupID, 
    #invTypesProduct.iconID AS productIconID, 
    #invTypesProduct.soundID AS productSoundID, 
    #invTypesProduct.graphicID AS productGraphicID, 

    #productGroup4.*, 
	#productGroup4.marketGroupID, 
    #productGroup4.parentGroupID, 
    #productGroup4.marketGroupName AS productGroup4Name, 
    #productGroup4.description, 
    #productGroup4.iconID, 
    #productGroup4.hasTypes,
    #productGroup3.*, 
	#productGroup3.marketGroupID, 
    #productGroup3.parentGroupID, 
    #productGroup3.marketGroupName AS productGroup3Name, 
    #productGroup3.description, 
    #productGroup3.iconID, 
    #productGroup3.hasTypes,
    #productGroup2.*, 
	#productGroup2.marketGroupID, 
    #productGroup2.parentGroupID, 
    #productGroup2.marketGroupName AS productGroup2Name, 
    #productGroup2.description, 
    #productGroup2.iconID, 
    #productGroup2.hasTypes, 
    #productGroup1.*, 
	#productGroup1.marketGroupID, 
    #productGroup1.parentGroupID, 
    #productGroup1.marketGroupName AS productGroup1Name, 
    #invProductParentGroups.description, 
    #invProductParentGroups.iconID, 
    #invProductParentGroups.hasTypes, 
    #productGroup0.*, 
    #productGroup0.marketGroupID, 
    #productGroup0.parentGroupID, 
    #productGroup0.marketGroupName AS productGroup0Name 
    #productGroup0.description, 
    #productGroup0.iconID, 
    #productGroup0.hasTypes, 
    
	#industryBlueprints.typeID AS placeholder 
from industryBlueprints 

# Joining blueprint invType and invGroups data 
left join invTypes on invTypes.typeID = industryBlueprints.typeID 
left join invGroups on invGroups.groupID = invTypes.groupID 

# Joining blueprint industryActivity(build time) and resulting pruduct limited to activityID 1 ie building
left join industryActivity on industryBlueprints.typeID = industryActivity.typeID and industryActivity.activityID = 1 
left join industryActivityProducts on invTypes.typeID = industryActivityProducts.typeID and industryActivityProducts.activityID = 1 

# Joining resulting product invtype
left join invTypes invTypesProduct on invTypesProduct.typeID = industryActivityProducts.productTypeID 
# Joining market groups for the product
left join invMarketGroups productGroup0 on productGroup0.marketGroupID = invTypesProduct.marketGroupID
left join invMarketGroups productGroup1 on productGroup1.marketGroupID = productGroup0.parentGroupID
left join invMarketGroups productGroup2 on productGroup2.marketGroupID = productGroup1.parentGroupID
left join invMarketGroups productGroup3 on productGroup3.marketGroupID = productGroup2.parentGroupID
left join invMarketGroups productGroup4 on productGroup4.marketGroupID = productGroup3.parentGroupID

# Do some final filtering and sorting
where invTypes.published = 1
order by productGroup4.marketGroupName, productGroup3.marketGroupName, productGroup2.marketGroupName, productGroup1.marketGroupName, productGroup0.marketGroupName;