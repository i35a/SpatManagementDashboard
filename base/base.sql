CREATE OR REPLACE VIEW public.v_utilisateur
AS SELECT u.id,
    u.login,
    e.fullname,
    e.site,
    e.job_position,
    u.pwd,
    u.idrole,
    r.description AS role_description,
    u.user_locked
   FROM utilisateur u
     JOIN employee e ON u.login = e.matricule
     JOIN role r ON u.idrole = r.id;