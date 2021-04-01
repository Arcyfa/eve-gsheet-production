SELECT 
	invTypes.typeID, 
	QUOTE(invTypes.typeName) AS typeName
FROM invTypes
where invTypes.typeID IS NOT NULL;