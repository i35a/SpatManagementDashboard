CREATE OR REPLACE VIEW public.v_tendance_fin
AS 
SELECT t.designation,
    t.periode_annuel,
    max(
        CASE
            WHEN t.periode_mensuel = 1 THEN t.tendance
            ELSE NULL::character varying
        END::text) AS janvier,
    max(
        CASE
            WHEN t.periode_mensuel = 2 THEN t.tendance
            ELSE NULL::character varying
        END::text) AS fevrier,
    max(
        CASE
            WHEN t.periode_mensuel = 3 THEN t.tendance
            ELSE NULL::character varying
        END::text) AS mars,
    max(
        CASE
            WHEN t.periode_mensuel = 4 THEN t.tendance
            ELSE NULL::character varying
        END::text) AS avril,
    max(
        CASE
            WHEN t.periode_mensuel = 5 THEN t.tendance
            ELSE NULL::character varying
        END::text) AS mai,
    max(
        CASE
            WHEN t.periode_mensuel = 6 THEN t.tendance
            ELSE NULL::character varying
        END::text) AS juin,
    max(
        CASE
            WHEN t.periode_mensuel = 7 THEN t.tendance
            ELSE NULL::character varying
        END::text) AS juillet,
    max(
        CASE
            WHEN t.periode_mensuel = 8 THEN t.tendance
            ELSE NULL::character varying
        END::text) AS aout,
    max(
        CASE
            WHEN t.periode_mensuel = 9 THEN t.tendance
            ELSE NULL::character varying
        END::text) AS septembre,
    max(
        CASE
            WHEN t.periode_mensuel = 10 THEN t.tendance
            ELSE NULL::character varying
        END::text) AS octobre,
    max(
        CASE
            WHEN t.periode_mensuel = 11 THEN t.tendance
            ELSE NULL::character varying
        END::text) AS novembre,
    max(
        CASE
            WHEN t.periode_mensuel = 12 THEN t.tendance
            ELSE NULL::character varying
        END::text) AS decembre
   FROM ( SELECT v.designation,
            v.periode_annuel,
            v.periode_mensuel,
            v.valeur_saisie AS realisation,
            ifp.valeur_saisie AS budget,
                CASE
                    WHEN v.valeur_saisie::double precision = 0::double precision THEN ifp.valeur_saisie
                    ELSE v.valeur_saisie
                END AS tendance
           FROM indicateur_fin v
             JOIN indicateur_fin_prev ifp ON ifp.designation::text = v.designation::text AND ifp.periode_mensuel = v.periode_mensuel
          WHERE v.type::text = 'REA'::text AND 
          ( v.periode_annuel::numeric = EXTRACT(year FROM CURRENT_DATE) or ( v.periode_annuel::numeric = EXTRACT(year FROM CURRENT_DATE)-1)) ) t
  GROUP BY t.designation, t.periode_annuel;