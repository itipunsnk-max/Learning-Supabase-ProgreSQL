-- Safe demo data only; do not replace IDs with production identities.
insert into public.sites (code, name) values ('SITE-A', 'Demo Maintenance Site') on conflict (code) do nothing;
insert into public.assets (site_id, asset_code, equipment_number, description, criticality)
select id, 'AST-MDB-001', 'EQ-001', 'Main Distribution Board Demo', 1 from public.sites where code = 'SITE-A'
on conflict (asset_code) do nothing;
