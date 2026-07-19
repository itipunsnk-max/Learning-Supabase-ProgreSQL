create or replace function public.next_ticket_number()
returns text language sql security invoker as $$
  select 'T-' || to_char(current_date, 'YYYYMMDD') || '-' || lpad((floor(random()*100000))::int::text, 5, '0');
$$;
