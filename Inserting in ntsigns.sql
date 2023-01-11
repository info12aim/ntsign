select * from SpecificationAttribute where  name = 'Die Assembly' --102
select * from SpecificationAttribute where  name = 'Manufacturer Part Number:' --7
select * from SpecificationAttribute where  name = 'Overall Height (in):' --8
select * from SpecificationAttribute where  name = 'Overall Length (in):' --40
select * from SpecificationAttribute where  name = 'Overall Width (in):' --9
select * from SpecificationAttribute where  name = 'Bead Tank Size (lb)' --109
select * from SpecificationAttribute where name = 'Application:' --5
select * from SpecificationAttribute where name = 'Available To Ship Within:' --6
select * from SpecificationAttribute where name = 'Brand:' --51
select * from SpecificationAttribute where name = 'Specifications' --104
select * from SpecificationAttribute where name = 'LineDriver Compatible'--80
select * from SpecificationAttribute where name = 'Dimensions'--130
select * from SpecificationAttribute where name = 'Fuel Source'--107
select * from SpecificationAttribute where name = 'Overall Height (in):'--8
select * from SpecificationAttribute where name = ' Compatible Surfaces:'--65
select * from SpecificationAttribute where name = 'Compatible Material'--94
select * from SpecificationAttribute where name = 'Compatible With:'--113
select * from SpecificationAttribute where name = 'Number of Colors'--95
select * from SpecificationAttribute where name = 'Shipping Class'--59
select * from SpecificationAttribute where name = 'Bead Tank Size (lb)'--109
select * from SpecificationAttribute where name = 'Number of Hoppers'--108
select * from SpecificationAttribute where name = 'Die Heater'--103
select * from SpecificationAttribute where name = 'Multimedia'--105
select * from SpecificationAttribute where name = 'Material Agitation'--106
select * from SpecificationAttribute where name = 'For Use With:' --53
select * from SpecificationAttribute where name = 'For Use On:' --100
select * from SpecificationAttribute where name = 'Type:' --12
select * from SpecificationAttribute where name = 'Product Series:' --10
select * from SpecificationAttribute where name = 'Inlet Size (in)' --135
select * from SpecificationAttribute where name = 'Inlet Thread Type' --136
select * from SpecificationAttribute where name = 'Mesh Size' --139
select * from SpecificationAttribute where name = 'UPC' --99
select * from SpecificationAttribute where name = 'Quantity Per Pack:' --99
select * from SpecificationAttribute where name = 'Tip Type' --142
select * from SpecificationAttribute where name = 'Maximum Working Pressure (psi)' --143
select * from SpecificationAttribute where name = 'Compatible Thread Size (in)' --144
select * from SpecificationAttribute where name = 'Gauge:' --99
select * from SpecificationAttribute where name = 'Weight (lb):' --13
select * from SpecificationAttribute where name = 'Aluminum Grade:' --16
select * from SpecificationAttribute where name = 'Sheeting Grade' --152
select * from SpecificationAttribute where name = 'Sheeting Color:' --75
select * from SpecificationAttribute where name = 'State Specific?' --159
select * from SpecificationAttribute where name = 'Distance' --160
select * from SpecificationAttribute where name = 'Sign Code:' --18
select * from SpecificationAttribute where name = 'Grade:' --2
select * from SpecificationAttribute where name = 'Color:' --41
select * from SpecificationAttribute where name = 'Size/Material:' --190
select * from SpecificationAttribute where name = 'Finish:' --19
select * from SpecificationAttribute where name = 'Wall Thickness (in):'
select * from SpecificationAttribute where name = 'Panel Sizes:'
select * from SpecificationAttribute where name = 'Sides:'
select * from SpecificationAttribute where name = 'Adhesive Type:'--36
select * from SpecificationAttribute where name = 'Sheet Width:' --179
select * from SpecificationAttribute where name = 'Application Temperature (Fahrenheit):' --37
select * from SpecificationAttribute where name = 'Liner:' --206
select * from SpecificationAttribute where name = 'Product Series:' --10
select * from SpecificationAttribute where name = 'Substrate:' --17
select * from SpecificationAttribute where name = 'Opacity:' --214
select * from SpecificationAttribute where name = 'For Use On:' --100
select * from SpecificationAttribute where name = 'Overall Width (Imperial):' --17
select * from SpecificationAttribute where name = 'Imaging Method:' --211
select * from SpecificationAttribute where name = 'Specifications Met:' --211
select * from SpecificationAttribute where name = 'Compatible With:' --113
select * from SpecificationAttribute where name = 'Spec/Color:' --221
select * from SpecificationAttribute where name = 'Florida APL Certification Number:' --221
select * from SpecificationAttribute where name = 'Letter Height:' --56
select * from SpecificationAttribute where name = 'Legend Height:' --227
select * from SpecificationAttribute where name = 'Preformed Thickness' --201
select * from SpecificationAttribute where name = 'Quantity Per Pack:' --101
200
--select * from SpecificationAttribute where Id = 56
--delete from SpecificationAttribute where Id = 200 --134

insert into SpecificationAttribute(Name,DisplayOrder) values('Legend Height:',0)

--insert into SpecificationAttribute(Name,DisplayOrder) values('Power Source',0),('Power Rating (HP)', 0),
--('Engine Brand',0),('Engine Model', 0),('Graco Note',0)

select * from SpecificationAttributeOption where id in(
'1185'
) 

SpecificationAttributeId = 59

--delete from SpecificationAttributeOption where name = '390, 490, Ultra 395/495/595, Ultra Max 695 Lo-Boy, GMAX 3400, LineLazer 3400, FinishPro 390, Frinish Pro 395' 

insert into SpecificationAttributeOption(SpecificationAttributeId,Name,DisplayOrder)
values
(227,'10',0)
,(9,'93',0)
,(227,'36 in',0)
(227,'10 ft',0)



update SpecificationAttributeOption 
set SpecificationAttributeId = '8'
where Id = 1630
--,(67,'10 mph16 km/h',0),(68,'Line Driver',0),(69,'GrindLazer, ThermoLazer 300TC, ThermoLazer ProMelt, LineLazer 130HS, LineLazer ES 1000, LineLazer ES 2000, LineLazer V 200HS, LineLazer V 3900, LineLazer V 5900',0),(70,'Gas',0),
--(71,'5.5',0),(72,'Honda',0),(73,'GX Engine',0),(74,'All Graco units do not include factory training.',0)

