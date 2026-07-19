-- Run in a non-production database after migrations.
select count(*) >= 0 as sites_queryable from public.sites;
select count(*) >= 1 as tickets_have_rls from pg_policies where tablename = 'tickets';
