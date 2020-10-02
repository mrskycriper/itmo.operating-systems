#!/bin/bash

bash task4.sh

awk 'BERIN {currentLine=0; lineCounter=0.0; currentParentId=0; ARTSum=0.0}
{
if (currentLine == 0)
{
	currentParentId=$7
	ARTSum+=$(11)
	lineCounter=1.0
}
else if (currentParentId == $7)
{
	ARTSum+=$(11)
	lineCounter++
}
else
{
	print "Average_Sleeping_Children_of_ParentID=" currentParentId " is " ARTSum/lineCounter
	currentParentId=$7
	ARTSum=$(11)
	lineCounter=1.0
}

print $0
currentLine++

}' out/task4.out > out/task5.out
