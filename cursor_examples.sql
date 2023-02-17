-- Cursor Examples.

-- One Cursor Update.
DECLARE 
CURSOR C IS SELECT field1, field2
FROM table1;	  
  BEGIN
  FOR T IN C
  LOOP
  UPDATE table2 x set x.field1 = t.field1
  where x.field2 = t.field2;       
end loop;
end;

-- One Cursor Insert.
DECLARE 
CURSOR C IS SELECT field1, field2
FROM table1;	  
  BEGIN
  FOR T IN C
  LOOP
  insert into table2 (field1, field2) 
  values 
  (t.field1, t.field2);
end loop;
end;

-- Two Cursor Insert.
DECLARE 
	CURSOR C1 IS SELECT field1 FROM table1; 	
	CURSOR C2 IS SELECT field1 FROM table2;
BEGIN
 FOR T1 IN C1 
  LOOP
   FOR T2 IN C2 
    LOOP
	 INSERT INTO table3 (field1, field2) 
	 VALUES 
	 t1.field1, t2.field1); 						 					  
  END LOOP;
 END LOOP;
END;

-- Two Cursor Update.
DECLARE 
	CURSOR C1 IS SELECT field1 FROM table1; 	
	CURSOR C2 IS SELECT field1 FROM table2;
BEGIN
 FOR T1 IN C1 
  LOOP
   FOR T2 IN C2 
    LOOP
     UPDATE table3 set field1 = t1.field1,
     field2 = t2.field1;						 					  
  END LOOP;
 END LOOP;
END;
