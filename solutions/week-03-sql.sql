select s.code as site_code, count(*) as open_tickets
from public.tickets t
join public.sites s on s.id = t.site_id
where t.deleted_at is null and t.status <> 'closed'
group by s.code
order by open_tickets desc;
