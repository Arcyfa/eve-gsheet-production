SELECT 
	invTypes.typeID, 
	CONCAT('"',invTypes.typeName,'"') AS typeName
FROM invTypes
where invTypes.typeID IS NOT NULL;