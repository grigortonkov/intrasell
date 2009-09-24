/********************************************************************************
*
* Autor: Grigor Tonkov
*
* Changes: 02.12.2007
* 30.08.2009 - Update TradeBoardGeschaeft
*
* Trigges for auto insert of LKWNr in Rechnung and Lieferschein
************************************/

DELIMITER |

DROP TRIGGER TrAfterInsertbuchRechnung;
|

CREATE TRIGGER TrAfterInsertbuchRechnung AFTER INSERT ON buchRechnung
  FOR EACH ROW BEGIN

  -- Eigenschaft setzen
	Insert into buchvorgaengeeigenschaften (VorgangTyp, Nummer, Name, `Value`)
	select 'AR', New.Nummer, 'TruckNumber', LKWNr
	from transportauftrag
  where AuftragNr = replace(NEW.Woher,'AU','')/* and LKWNr is not null*/;


  -- Update trade board geschaeft
  Update tradeboardgeschaeft set
   RechnungNr = NEW.Nummer
  where RechnungNr is null
  and AuftragNr = replace(NEW.Woher,'AU','');

  END;

|



DROP TRIGGER TrAfterBeforeInsertbuchLieferschein;
|

CREATE TRIGGER TrAfterBeforeInsertbuchLieferschein BEFORE INSERT ON buchLieferschein
  FOR EACH ROW BEGIN
  if NEW.Woher is not null and INSTR(NEW.Woher,'AU')=1 then

           -- set KundeNr 2 als Entladeplatz

       set New.KundNr2 = (select EntladeplatzNr from transportauftrag where AuftragNr = replace(NEW.Woher,'AU',''));

      /*
       UPDATE buchLieferschein set KundNr2 = (select EntladeplatzNr from transportauftrag where AuftragNr = replace(NEW.Woher,'AU',''))
      where Nummer = New.Nummer and
       exists (select EntladeplatzNr from transportauftrag where AuftragNr = replace(NEW.Woher,'AU',''));
        */
  end if;
END;

|

DROP TRIGGER TrAfterInsertbuchLieferschein;
|

CREATE TRIGGER TrAfterInsertbuchLieferschein AFTER INSERT ON buchLieferschein
  FOR EACH ROW BEGIN
  if NEW.Woher is not null and INSTR(NEW.Woher,'AU')=1 then
	    Insert into buchvorgaengeeigenschaften (VorgangTyp, Nummer, Name, `Value`)
	      select 'LI', New.Nummer, 'TruckNumber', LKWNr
	      from transportauftrag where AuftragNr = replace(NEW.Woher,'AU','')/* and LKWNr is not null*/;



  end if;
END;
|

DROP TRIGGER TrAfterInsertbuchVorgaengeEigenschaften;
 |

CREATE TRIGGER TrAfterInsertbuchVorgaengeEigenschaften AFTER INSERT ON buchvorgaengeeigenschaften
  FOR EACH ROW BEGIN


  -- Update trade board geschaeft VerladeTag mit dem in den Eigenshcaftendefinierten tag
  Update tradeboardgeschaeft set
   VerladeTag = concat(substr(NEW.Value,7,4),'-', substr(NEW.Value,4,2), '-',  substr(NEW.Value,1,2))
  where AuftragNr =  NEW.Nummer
     and NEW.Name = 'VerladeTag' and NEW.VorgangTyp = 'AU';

  END;

|


DELIMITER ;