-- LeConte Training — Supabase schema for the shared training board
-- Run this once in your Supabase project: Dashboard → SQL Editor → New query → paste → Run.
-- Until this is run, the app works fully local and Settings shows
-- "Local only - shared board not set up yet".

create table if not exists leconte_profiles (
  id text primary key,
  name text not null,
  trail text default 'alum',
  created_at timestamptz default now()
);

create table if not exists leconte_sessions (
  id text primary key,
  profile_id text not null references leconte_profiles(id) on delete cascade,
  entry_date date not null,
  type text not null,
  miles numeric not null default 0,
  vertical_ft numeric not null default 0,
  minutes numeric not null default 0,
  pack_lb numeric not null default 0,
  pain integer not null default 0,
  note text,
  created_at timestamptz default now()
);

create index if not exists idx_leconte_sessions_profile_date
  on leconte_sessions (profile_id, entry_date);

-- Simple open access: anyone with your project URL + anon key can read/write
-- these two tables. For a personal training board this is fine. If you later
-- want to lock it down, replace these policies with authenticated-user policies.
alter table leconte_profiles enable row level security;
alter table leconte_sessions enable row level security;

drop policy if exists "open access" on leconte_profiles;
create policy "open access" on leconte_profiles
  for all using (true) with check (true);

drop policy if exists "open access" on leconte_sessions;
create policy "open access" on leconte_sessions
  for all using (true) with check (true);
