-- query changes
alter table profiles add column permissions_old jsonb;
update profiles set permissions_old = permissions where company_id is not null ;

-- export_physical_notice
-- add changes confirmed
update profiles set permissions = jsonb_set(permissions,'{notice}',( coalesce(permissions -> 'notice','{}') || jsonb_build_object('export_physical_notice',permissions -> 'Core Collection Modules'->'export_physical_notice')))  
where company_id is not null ;

-- remove changes
select permissions #- '{Core Collection Modules,export_physical_notice}'
from profiles p 
where company_id is not null ;


-- download_digital_notice_pdf
-- add changes confirmed
update profiles set permissions = jsonb_set(permissions,'{notice}',( coalesce(permissions -> 'notice','{}') || jsonb_build_object('download_digital_notice_pdf',permissions -> 'Core Collection Modules'->'download_digital_notice_pdf')))  
where company_id is not null ;

-- remove changes
select permissions #- '{Core Collection Modules,download_digital_notice_pdf}'
from profiles p 
where company_id is not null ;


-- download_notice_tracking_pdf
-- add changes confirmed
update profiles set permissions = jsonb_set(permissions,'{notice}',( coalesce(permissions -> 'notice','{}') || jsonb_build_object('download_notice_tracking_pdf',permissions -> 'Core Collection Modules'->'download_notice_tracking_pdf')))  
where company_id is not null ;

-- remove changes
select permissions #- '{Core Collection Modules,download_notice_tracking_pdf}'
from profiles p 
where company_id is not null ;
