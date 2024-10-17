SELECT origin, SUM(nb_fans) AS nb_fans;
FROM metal_bands;
GROUP BY origin;
GROUP BY nb_fans DESC;