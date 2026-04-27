CREATE OR REPLACE VIEW public.v_indicateur_fin_chrge
AS SELECT r.designation,
    a.libelle AS libelle_activite,
    rl.description AS role_utilisateur,
    c.valeur AS categorie_rubrique,
    gr.valeur AS groupe_rubrique,
    gr.libelle AS groupe_rubrique_lib,
    t.label AS type,
    r.periode_annuel,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 1::numeric)) AS janvier,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 2::numeric)) AS fevrier,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 3::numeric)) AS mars,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 4::numeric)) AS avril,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 5::numeric)) AS mai,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 6::numeric)) AS juin,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 7::numeric)) AS juillet,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 8::numeric)) AS aout,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 9::numeric)) AS septembre,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 10::numeric)) AS octobre,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 11::numeric)) AS novembre,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 12::numeric)) AS decembre
   FROM indicateur_fin_chrge r
     JOIN activite a ON a.id = r.idactivite
     JOIN role rl ON rl.id = a.idrole
     JOIN categ_rubrique c ON c.id = r.idcateg_rubrique
     JOIN groupe_rubrique gr ON gr.id = c.groupe_rub
     LEFT JOIN t_mois tm ON tm.id = r.periode_mensuel
     LEFT JOIN type t ON t.id::text = r.type::text
  WHERE a.libelle::text = 'ACT_FIN'::text AND r.periode_annuel::numeric = EXTRACT(year FROM CURRENT_DATE)
  GROUP BY r.designation, a.libelle, rl.description, c.valeur, gr.valeur, gr.libelle, r.periode_annuel, t.label
UNION ALL
 SELECT 'REA_N1'::character varying AS designation,
    a.libelle AS libelle_activite,
    rl.description AS role_utilisateur,
    c.valeur AS categorie_rubrique,
    gr.valeur AS groupe_rubrique,
    gr.libelle AS groupe_rubrique_lib,
    t.label AS type,
    r.periode_annuel,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 1::numeric)) AS janvier,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 2::numeric)) AS fevrier,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 3::numeric)) AS mars,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 4::numeric)) AS avril,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 5::numeric)) AS mai,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 6::numeric)) AS juin,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 7::numeric)) AS juillet,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 8::numeric)) AS aout,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 9::numeric)) AS septembre,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 10::numeric)) AS octobre,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 11::numeric)) AS novembre,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 12::numeric)) AS decembre
   FROM indicateur_fin_chrge r
     JOIN activite a ON a.id = r.idactivite
     JOIN role rl ON rl.id = a.idrole
     JOIN categ_rubrique c ON c.id = r.idcateg_rubrique
     JOIN groupe_rubrique gr ON gr.id = c.groupe_rub
     LEFT JOIN t_mois tm ON tm.id = r.periode_mensuel
     LEFT JOIN type t ON t.id::text = r.type::text
  WHERE a.libelle::text = 'ACT_FIN'::text AND r.periode_annuel::numeric = (EXTRACT(year FROM CURRENT_DATE) - 1::numeric)
  GROUP BY a.libelle, rl.description, c.valeur, gr.valeur, gr.libelle, r.periode_annuel, t.label;
  
  
  
  CREATE OR REPLACE VIEW public.v_indicateur_fin_chrge_prev
AS SELECT r.designation,
    a.libelle AS libelle_activite,
    rl.description AS role_utilisateur,
    c.valeur AS categorie_rubrique,
    gr.valeur AS groupe_rubrique,
    gr.libelle AS groupe_rubrique_lib,
    t.label AS type,
    r.periode_annuel,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 1::numeric)) AS janvier,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 2::numeric)) AS fevrier,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 3::numeric)) AS mars,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 4::numeric)) AS avril,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 5::numeric)) AS mai,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 6::numeric)) AS juin,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 7::numeric)) AS juillet,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 8::numeric)) AS aout,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 9::numeric)) AS septembre,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 10::numeric)) AS octobre,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 11::numeric)) AS novembre,
    COALESCE(sum(r.valeur_saisie::double precision) FILTER (WHERE r.periode_mensuel::numeric = 12::numeric)) AS decembre
   FROM indicateur_fin_chrge_prev r
     JOIN activite a ON a.id = r.idactivite
     JOIN role rl ON rl.id = a.idrole
     JOIN categ_rubrique c ON c.id = r.idcateg_rubrique
     JOIN groupe_rubrique gr ON gr.id = c.groupe_rub
     LEFT JOIN t_mois tm ON tm.id = r.periode_mensuel
     LEFT JOIN type t ON t.id::text = r.type::text
  WHERE a.libelle::text = 'ACT_FIN'::text
  GROUP BY r.designation, a.libelle, rl.description, c.valeur, gr.valeur, gr.libelle, r.periode_annuel, t.label;