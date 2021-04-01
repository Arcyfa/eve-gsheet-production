SELECT 
	invTypes.typeID, 
	invTypes.typeName AS typeName
FROM invTypes
where invTypes.typeID IS NOT NULL;