create or replace view public.v_work_order_reporting as
select t.ticket_number, t.reported_at, t.closed_at, t.priority, t.status, s.code as site_code, a.asset_code, p.display_name as reporter, extract(epoch from (coalesce(t.closed_at, now()) - t.reported_at))/3600 as aging_hours
from public.tickets t join public.sites s on s.id = t.site_id left join public.assets a on a.id = t.asset_id join public.profiles p on p.id = t.reporter_id where t.deleted_at is null;
