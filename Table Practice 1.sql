select distinct pm.programId ,STRING_AGG(pmc.firstName+' '+pmc.lastName, ', ') WITHIN GROUP (ORDER BY pmc.firstName+' '+pmc.lastName DESC) AS LEARNING_PARTNER,

max(cast( pmc1.isActive as int)) POD_LEAD_STATUS


select * from [dbo].[webinars]
select * from [dbo].[Webinars_SMEMappings]
select * from [dbo].[Webinars_Attendees]
select * from [dbo].[webinar_Attendances]

select * from [dbo].[Users]


/*for finding webinar names*/
select firstName, lastName, topic, ws.duration
from dbo.Webinars_Attendees wa
left join dbo.Users
on  [dbo].[Users].userId = wa.userId
left join [dbo].[webinars] ws
on ws.id = wa.webinarsId
left join webinar_Attendances wac
on wac.participantId = wa.userId

select distinct u.oracleId,
u.career_setting_id,
u.firstName + ' ' + u.lastName as name,
u.email,
wb.topic,
mst.name as status, 
wba.durationAttended as duration,
Convert(datetimeoffset, lsr.scheduleDate AT TIME ZONE 'India Standard Time') as scheduleDate
from webinars wb
left outer join Webinars_Attendees wa on wa.webinarsId =  wb.id
left outer join Users u on u.userId = wa.userId
left outer join webinar_Attendances wba on wba.atributeId = wa.webinarsId and wba.participantId = wa.id
left outer join Master_StatusTypes mst on mst.id =wba.status
left outer join LP_Schedules lps on wba.atributeId=lps.attributeId and lps.categoryId = 10
inner join LP_Schedule_RecurringDates lsr on lps.id=lsr.fkScheduleId 
where wba.atributeId = wb.id 
and cast(SWITCHOFFSET(wba.sessionDate,'+05:30') as date) = cast(SWITCHOFFSET(lsr.scheduleDate,'+05:30')as date) 
and wba.scheduleId = lsr.fkScheduleId



select * from [dbo].[Batches]
/*program, batch, batch candidate*/

select * from Programs


select * from [dbo].[Programs]  /*this contains program "id" mapped. For TGA
id is 162 */

select * from Users

select * from [dbo].[Batches]	 /*record of batches having Id, Program id */

select * from [dbo].[BatchCandidates]
select * from Master_Domains

select bt.name as batchName, pm.name as programName, bc.trainingStartDate, bc.trainingEndDate, u.oracleId, u.career_setting_id, u.userName, u.firstName, u.lastName, bt.StartDate as batchStartDate, bt.EndDate as bacthEndDate
from [Batches] bt
left join Programs pm
on bt.program_id = pm.id
left join BatchCandidates bc
on bt.id = bc.batchId
left join Users u
on u.userId = bc.userId

select * from Master_StatusTypes

select *  
from ProgramCOECapabilityMappings




with coemapping as(
select distinct pm.programId ,STRING_AGG(pmc1.name, ', ') WITHIN GROUP (ORDER BY pmc1.name DESC) AS COE
from  [dbo].[ProgramCOECapabilityMappings] pm
left join [dbo].Master_COECapabilities pmc1
on pm.coecapabilityId=pmc1.id
group by pm.programId)
select bt.name as batchName, pm.name as programName, bc.trainingStartDate, bc.trainingEndDate, u.oracleId, u.career_setting_id, u.userName, u.firstName, u.lastName, bt.StartDate as batchStartDate, bt.EndDate as bacthEndDate
, cm.COE, bt.id as BatchID, mst.na
me
from [Batches] bt
left join Programs pm
on bt.program_id = pm.id
left join BatchCandidates bc
on bt.id = bc.batchId
left join Users u
on u.userId = bc.userId
left join coemapping cm
on cm.programId = pm.id
left join Master_StatusTypes mst
on mst.id= bc.trainingStatus
and mst.type = 'Candidate'


select distinct pm.programId ,pmc1.name
from  [dbo].[ProgramCOECapabilityMappings] pm
left join [dbo].Master_COECapabilities pmc1
on pm.coecapabilityId=pmc1.id
where programId=175



select * from [dbo].[LearningPlan_Sessions]
select * from [dbo].[LearningPlan_Workshops]


select * from [dbo].[Batch_MentorMappings]
select * from [dbo].[LearningPlan_Workshops]
Batch_ExternalTr

/*
Task 1: Making an understanding in Program, Batch, Sessions
*/

select * from [dbo].[Master_BatchProgramTypes]   -> /*contains the id and categories of batch like Campus,Lateral, Interns.
doubt is what Parent ID is here what's parent id here */



select distinct pm.programId ,STRING_AGG(pmc1.name, ', ') WITHIN GROUP (ORDER BY pmc1.name DESC) AS COE
from  [dbo].[ProgramCOECapabilityMappings] pm
left join [dbo].Master_COECapabilities pmc1
on pm.coecapabilityId=pmc1.id
group by pm.programId

/*SME Contributions Table Understanding*/

select * from [dbo].[Webinars_SMEMappings]
select * from [dbo].[Master_SMELists]
select * from Batch_SMEMappings
select * from Batch_ExternalTrainerMappings
select * from [dbo].[ProgramSMEMappings]


select * from [dbo].[Batch_InternalTrainerMappings]
select * from Batch_ExternalTrainerMappings
select * from [dbo].[Master_ExternalTrainers]

select me.[name] as Names
from [dbo].[Master_ExternalTrainers] me
left join Batch_ExternalTrainerMappings et


/*statement 1*/
select * from [LNOD_STAGING].dbo.[learner_transcript_new]
where [delivery Type] is not null

select * from [LNOD_STAGING].dbo.[learner_transcript_new]
where course in ('Craft Learning | Gang of Four & Solid Principle',
'Craft Learning | Spring Reactive Programming')
and [delivery Type] is not null

select * from [LNOD_STAGING].dbo.[learner_transcript_new]
where course in ('Craft Learning | Gang of Four & Solid Principle',
'Craft Learning | Spring Reactive Programming')
and [delivery Type] is not null