﻿create procedure spUpsertAspNetUsers @AspNetUsers AspNetUserstype READONLY
as 
BEGIN
MERGE AspNetUsers as target_sqldb
USING @AspNetUsers as source_tblstg
ON (target_sqldb.Id=source_tblstg.Id)

when matched then

UPDATE SET
Id    =source_tblstg.Id ,
Email	=source_tblstg.Email,
EmailConfirmed	=source_tblstg.EmailConfirmed,
PasswordHash	=source_tblstg.PasswordHash,
SecurityStamp	=source_tblstg.SecurityStamp, 
PhoneNumber	=source_tblstg.PhoneNumber ,
PhoneNumberConfirmed	=source_tblstg.PhoneNumberConfirmed,
TwoFactorEnabled	=source_tblstg.TwoFactorEnabled,
LockoutEndDateUtc 	=source_tblstg.LockoutEndDateUtc ,
LockoutEnabled 	=source_tblstg.LockoutEnabled ,
IsLockedOut	=source_tblstg.IsLockedOut,
AccessFailedCount 	=source_tblstg.AccessFailedCount ,
UserName 	=source_tblstg.UserName, 
IsActive 	=source_tblstg.IsActive ,
IsInternalUser	=source_tblstg.IsInternalUser,
UserPreferencesJson 	=source_tblstg.UserPreferencesJson, 
FirstName	=source_tblstg.FirstName,
MiddleName 	=source_tblstg.MiddleName, 
LastName 	=source_tblstg.LastName, 
Salutation 	=source_tblstg.Salutation ,
DrNpi 	=source_tblstg.DrNpi, 
IsSpecialtyEndodontics	=source_tblstg.IsSpecialtyEndodontics,
IsSpecialtyOrthodonticsDentofacialOrthopedics	=source_tblstg.IsSpecialtyOrthodonticsDentofacialOrthopedics, 
IsSpecialtyOralMaxillofacialPathology 	=source_tblstg.IsSpecialtyOralMaxillofacialPathology ,
IsSpecialtyPediatricDentistry	=source_tblstg.IsSpecialtyPediatricDentistry,
IsSpecialtyPeriodontics 	=source_tblstg.IsSpecialtyPeriodontics, 
IsSpecialtyProsthodontics	=source_tblstg.IsSpecialtyProsthodontics,
IsSpecialtyDentalPublicHealth 	=source_tblstg.IsSpecialtyDentalPublicHealth ,
IsSpecialtyOralMaxillofacialRadiology	=source_tblstg.IsSpecialtyOralMaxillofacialRadiology,
IsSpecialtyOralMaxillofacialSurgery 	=source_tblstg.IsSpecialtyOralMaxillofacialSurgery ,
ChangeUtc	=source_tblstg.ChangeUtc,
ChangeUserGuid	=source_tblstg.ChangeUserGuid,
ChangeProgramName	=source_tblstg.ChangeProgramName,
CreateUtc	=source_tblstg.CreateUtc,
CreateUserGuid 	=source_tblstg.CreateUserGuid ,
CreateProgramName	=source_tblstg.CreateProgramName,
IsAdUser	=source_tblstg.IsAdUser,
LastLoginUtc 	=source_tblstg.LastLoginUtc ,
IsMarginMarkingCertified 	=source_tblstg.IsMarginMarkingCertified ,
BillingAccountGuid 	=source_tblstg.BillingAccountGuid, 
MarginMarkingCertificationDateTime 	=source_tblstg.MarginMarkingCertificationDateTime, 
MarginMarkingCertificationStatus 	=source_tblstg.MarginMarkingCertificationStatus, 
DdsUserPreferencesJson 	=source_tblstg.DdsUserPreferencesJson ,
WelcomeLastSentUtc 	=source_tblstg.WelcomeLastSentUtc ,
ChangePasswordReminderUtc	=source_tblstg.ChangePasswordReminderUtc,
LastFirstName	=source_tblstg.LastFirstName,
FirstLastName 	=source_tblstg.FirstLastName ,
EmailMeDraftedOrder	=source_tblstg.EmailMeDraftedOrder,
EmailMeSubmittedOrder 	=source_tblstg.EmailMeSubmittedOrder ,
EmailMeOnHoldOrder 	=source_tblstg.EmailMeOnHoldOrder, 
EmailMeCanceledOrder 	=source_tblstg.EmailMeCanceledOrder, 
EmailMeReviewReadyOrder	=source_tblstg.EmailMeReviewReadyOrder,
EmailMeRefinementReadyOrder	=source_tblstg.EmailMeRefinementReadyOrder,
EmailMeNewMessages	=source_tblstg.EmailMeNewMessages,
EmailMeAwaitingImpressions 	=source_tblstg.EmailMeAwaitingImpressions, 
EmailMeRejectedOrder	=source_tblstg.EmailMeRejectedOrder,
AnnouncementLastViewedUtc	=source_tblstg.AnnouncementLastViewedUtc

when not matched then

insert
(
    Id,
	Email,
	EmailConfirmed ,
	PasswordHash,
	SecurityStamp,
	PhoneNumber, 
	PhoneNumberConfirmed ,
	TwoFactorEnabled,
	LockoutEndDateUtc,
	LockoutEnabled,
	IsLockedOut,
	AccessFailedCount,
	UserName ,
	IsActive,
	IsInternalUser,
	UserPreferencesJson,
	FirstName ,
	MiddleName ,
	LastName,
	Salutation ,
	DrNpi ,
	IsSpecialtyEndodontics,
	IsSpecialtyOrthodonticsDentofacialOrthopedics,
	IsSpecialtyOralMaxillofacialPathology ,
	IsSpecialtyPediatricDentistry ,
	IsSpecialtyPeriodontics,
	IsSpecialtyProsthodontics ,
	IsSpecialtyDentalPublicHealth ,
	IsSpecialtyOralMaxillofacialRadiology,
	IsSpecialtyOralMaxillofacialSurgery, 
	ChangeUtc,
	ChangeUserGuid,
	ChangeProgramName,
	CreateUtc,
	CreateUserGuid,
	CreateProgramName ,
	IsAdUser,
	LastLoginUtc,
	IsMarginMarkingCertified,
	BillingAccountGuid,
	MarginMarkingCertificationDateTime,
	MarginMarkingCertificationStatus,
	DdsUserPreferencesJson,
	WelcomeLastSentUtc ,
	ChangePasswordReminderUtc,
	LastFirstName ,
	FirstLastName ,
	EmailMeDraftedOrder,
	EmailMeSubmittedOrder ,
	EmailMeOnHoldOrder ,
	EmailMeCanceledOrder ,
	EmailMeReviewReadyOrder ,
	EmailMeRefinementReadyOrder, 
	EmailMeNewMessages,
	EmailMeAwaitingImpressions ,
	EmailMeRejectedOrder ,
	AnnouncementLastViewedUtc
	)
	VALUES
	(
	    source_tblstg.Id,
	source_tblstg.Email,
	source_tblstg.EmailConfirmed ,
	source_tblstg.PasswordHash,
	source_tblstg.SecurityStamp,
	source_tblstg.PhoneNumber, 
	source_tblstg.PhoneNumberConfirmed ,
	source_tblstg.TwoFactorEnabled,
	source_tblstg.LockoutEndDateUtc,
	source_tblstg.LockoutEnabled,
	source_tblstg.IsLockedOut,
	source_tblstg.AccessFailedCount,
	source_tblstg.UserName ,
	source_tblstg.IsActive,
	source_tblstg.IsInternalUser,
	source_tblstg.UserPreferencesJson,
	source_tblstg.FirstName ,
	source_tblstg.MiddleName ,
	source_tblstg.LastName,
	source_tblstg.Salutation ,
	source_tblstg.DrNpi ,
	source_tblstg.IsSpecialtyEndodontics,
	source_tblstg.IsSpecialtyOrthodonticsDentofacialOrthopedics,
	source_tblstg.IsSpecialtyOralMaxillofacialPathology ,
	source_tblstg.IsSpecialtyPediatricDentistry ,
	source_tblstg.IsSpecialtyPeriodontics,
	source_tblstg.IsSpecialtyProsthodontics ,
	source_tblstg.IsSpecialtyDentalPublicHealth ,
	source_tblstg.IsSpecialtyOralMaxillofacialRadiology,
	source_tblstg.IsSpecialtyOralMaxillofacialSurgery, 
	source_tblstg.ChangeUtc,
	source_tblstg.ChangeUserGuid,
	source_tblstg.ChangeProgramName,
	source_tblstg.CreateUtc,
	source_tblstg.CreateUserGuid,
	source_tblstg.CreateProgramName ,
	source_tblstg.IsAdUser,
	source_tblstg.LastLoginUtc,
	source_tblstg.IsMarginMarkingCertified,
	source_tblstg.BillingAccountGuid,
	source_tblstg.MarginMarkingCertificationDateTime,
	source_tblstg.MarginMarkingCertificationStatus,
	source_tblstg.DdsUserPreferencesJson,
	source_tblstg.WelcomeLastSentUtc ,
	source_tblstg.ChangePasswordReminderUtc,
	source_tblstg.LastFirstName ,
	source_tblstg.FirstLastName ,
	source_tblstg.EmailMeDraftedOrder,
	source_tblstg.EmailMeSubmittedOrder ,
	source_tblstg.EmailMeOnHoldOrder ,
	source_tblstg.EmailMeCanceledOrder ,
	source_tblstg.EmailMeReviewReadyOrder ,
	source_tblstg.EmailMeRefinementReadyOrder, 
	source_tblstg.EmailMeNewMessages,
	source_tblstg.EmailMeAwaitingImpressions ,
	source_tblstg.EmailMeRejectedOrder ,
	source_tblstg.AnnouncementLastViewedUtc
	);
    END