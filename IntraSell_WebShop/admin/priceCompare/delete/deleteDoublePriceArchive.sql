DELETE 
FROM `pricecomparelieferantenartikelpreisearchive`
where vkpreis = 0


DELETE LOW_PRIORITY priceCompareLieferantenArtikelPreiseArchive FROM priceCompareLieferantenArtikelPreiseArchive 
INNER JOIN 
(SELECT ALL p1.preisID  
FROM priceCompareLieferantenArtikelPreiseArchive  AS p1
WHERE 
EXISTS 
        (SELECT *  
      FROM priceCompareLieferantenArtikelPreiseArchive p2 
      WHERE p1.lieferantnr = p2.lieferantnr AND 
          p1.artikelnr = p2.artikelnr AND  
          p1.preisDatum > p2.preisdatum AND  
          p2.VKPREIS = p1.VKPREIS AND NOT EXISTS 
              (SELECT * FROM priceCompareLieferantenArtikelPreiseArchive p3  
               WHERE p1.artikelnr = p3.artikelnr  and p1.lieferantnr = p3.lieferantnr and p1.preisDatum > p3.preisdatum AND p3.preisDatum > p2.preisdatum))
AND EXISTS 
        (SELECT *  
         FROM priceCompareLieferantenArtikelPreiseArchive p4
         WHERE p1.lieferantnr = p4.lieferantnr AND 
          p1.artikelnr = p4.artikelnr AND  
          p1.preisDatum < p4.preisdatum))
tmpDelArch 
ON priceCompareLieferantenArtikelPreiseArchive.preisid= tmpDelArch.preisid;

