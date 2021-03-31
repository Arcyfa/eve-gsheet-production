SELECT 
	invTypes.typeID, 
	invTypes.typeName 
FROM invTypes
where invTypes.typeID IS NOT NULL;