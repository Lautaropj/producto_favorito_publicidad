WITH favoritos AS (
	SELECT
        cvd.FCLIENTE AS nombre_cliente,
		cvd.EMAIL AS email_cliente,
        cv.FART AS cod_producto,
		SUM(cv.FCANT) AS cantidad_total_comprada,
        ROW_NUMBER() OVER (
            PARTITION BY cvd.EMAIL 
            ORDER BY COUNT(DISTINCT cvd.FNUMCOMP) DESC, SUM(cv.FCANT) DESC
        ) AS ranking
	FROM [DRAGONFISH_ALCORTA].[ZooLogic].[COMPROBANTEVDET] cv
	JOIN [DRAGONFISH_ALCORTA].[ZooLogic].[COMPROBANTEV] cvd 
		 ON cvd.CODIGO = cv.CODIGO
	WHERE 
        cvd.EMAIL != ''
        AND cvd.CANCELAR = 0
		AND cv.FART NOT IN ('BOLSASCHICAS','BOLSASGRANDES','BOLSASXS')
		AND cvd.FCLIENTE NOT IN ('CF','Consumidor Final')
	GROUP BY
        cvd.EMAIL, cvd.FCLIENTE, cv.FART, cv.FTXT
)
SELECT nombre_cliente, email_cliente, cod_producto
FROM favoritos
WHERE ranking = 1 AND cantidad_total_comprada >=2
ORDER BY cantidad_total_comprada DESC;
