
DELIMITER |

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