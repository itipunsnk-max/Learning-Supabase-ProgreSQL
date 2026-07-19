create or replace function public.log_ticket_status_change()
returns trigger language plpgsql security invoker as $$
begin
  if new.status is distinct from old.status then
    insert into public.status_history(ticket_id, from_status, to_status, changed_by, note)
    values (new.id, old.status, new.status, auth.uid(), 'Status changed by application');
  end if;
  return new;
end;
$$;
drop trigger if exists ticket_status_history on public.tickets;
create trigger ticket_status_history after update of status on public.tickets for each row execute function public.log_ticket_status_change();
