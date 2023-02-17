## Cursors and For Loops - PL/SQL
How to work with cursors and for loops in PLSQL (Procedural Language SQL for Oracle Databases).

![Badge_Language](https://img.shields.io/badge/Language-PLSQL-brightgreen)

### About

One of the distinguishing features in Oracle Procedural Language is to enable the creation and execution of programming blocks without procedures, or 'outside' procedures if you will, that facilitate the job and saves time.

In situations that you need to update data from a table, using data that exists in another table, there are several approaches that you could do.

In MySQL for example you can do updates using inner joins between tables, but you can't do this in PL/SQL. So one of the most efficient approaches in my opinion is to use the Cursor and For Loop feature.

### Simple Update with Cursor/ForLoop.

The basic syntax of the **CURSOR** and **FORLOOP** statements is as follows:

```
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
```

> INSERT with Cursor/ForLoop.

You can also do inserts with the same method as below:

```
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
```
We know that is possible to use the **FOR LOOP** statement without the cursor declaration, and you can just put the table1 (in this example) inside the FOR LOOP without cursor, but in this case you must to declare a variable to exit the loop, using the cursor the loop will persistis until the last data inside **"C"**, this is why i like this approach for this kind of update.

### Using multiple Cursors and Loops.

You can also do more than one cursor and loops for one single update or insert, this is very usefull when you need to get data from multiple tables to update or insert in another table.

The syntax of multiple **CURSORS** and **FORLOOPS** statements is as follows:

- Insert:
```
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
					  (t1.field1, t2.field1); 						 					  
			END LOOP;
		END LOOP;
END;
```

- Update:
```
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
```

### Conclusion.

