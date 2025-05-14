
DoCmd.RunSQL "CREATE TABLE Passager(" & _
   "idPassager VARCHAR(50)," & _
   "nom VARCHAR(50)," & _
   "prenom VARCHAR(50)," & _
   "adresse VARCHAR(50)," & _
   "PoidsBag VARCHAR(50)," & _
   "PRIMARY KEY(idPassager)" & _
");"   
      
DoCmd.RunSQL "CREATE TABLE Bagage(" & _
   "numBagage VARCHAR(50)," & _
   "poidsBagage VARCHAR(50)," & _
   "PRIMARY KEY(numBagage)" & _
");"   

DoCmd.RunSQL "CREATE TABLE porte(" & _
   "porteEmbarq VARCHAR(50)," & _
   "PRIMARY KEY(porteEmbarq)" & _
");"   

DoCmd.RunSQL "CREATE TABLE piste(" & _
   "numPiste VARCHAR(50)," & _
   "taillePiste VARCHAR(50)," & _
   "statut VARCHAR(50)," & _
   "PRIMARY KEY(numPiste)" & _
");"   

DoCmd.RunSQL "CREATE TABLE Avions(" & _
   "idAvions VARCHAR(50)," & _
   "modelAvion VARCHAR(50)," & _
   "marque VARCHAR(50)," & _
   "carburant VARCHAR(50)," & _
   "nbPlaces VARCHAR(50)," & _
   "PRIMARY KEY(idAvions)" & _
");"   

DoCmd.RunSQL "CREATE TABLE Compagnie(" & _
   "idCompagnie VARCHAR(50)," & _
   "adresse VARCHAR(50)," & _
   "nom VARCHAR(50)," & _
   "PRIMARY KEY(idCompagnie)" & _
");"   

DoCmd.RunSQL "CREATE TABLE personnelle(" & _
   "idPersonelle VARCHAR(50)," & _
   "nomPersonelle VARCHAR(50)," & _
   "prenomPersonelle VARCHAR(50)," & _
   "metier VARCHAR(50)," & _
   "PRIMARY KEY(idPersonelle)" & _
");"   

DoCmd.RunSQL "CREATE TABLE ressource(" & _
   "id_ressource VARCHAR(50)," & _
   "nom_ressource VARCHAR(50)," & _
   "PRIMARY KEY(id_ressource)" & _
");"   

DoCmd.RunSQL "CREATE TABLE type_Tache(" & _
   "idTypeTache VARCHAR(50)," & _
   "categTache VARCHAR(50)," & _
   "PRIMARY KEY(idTypeTache)" & _
");"   

DoCmd.RunSQL "CREATE TABLE Vol(" & _
   "numVol VARCHAR(50)," & _
   "dateDebutVol VARCHAR(50)," & _
   "dateFinVol VARCHAR(50)," & _
   "statut VARCHAR(50)," & _
   "destination VARCHAR(50)," & _
   "idCompagnie VARCHAR(50) NOT NULL," & _
   "porteEmbarq VARCHAR(50) NOT NULL," & _
   "PRIMARY KEY(numVol)," & _
   "FOREIGN KEY(idCompagnie) REFERENCES Compagnie(idCompagnie)," & _
   "FOREIGN KEY(porteEmbarq) REFERENCES porte(porteEmbarq)" & _
");"   

DoCmd.RunSQL "CREATE TABLE tache(" & _
   "id_tache VARCHAR(50)," & _
   "nomTache VARCHAR(50)," & _
   "idTypeTache VARCHAR(50) NOT NULL," & _
   "PRIMARY KEY(id_tache)," & _
   "UNIQUE(idTypeTache)," & _
   "FOREIGN KEY(idTypeTache) REFERENCES type_Tache(idTypeTache)" & _
");"   

DoCmd.RunSQL "CREATE TABLE Billet(" & _
   "numBillet VARCHAR(50)," & _
   "numVol VARCHAR(50) NOT NULL," & _
   "PRIMARY KEY(numBillet)," & _
   "FOREIGN KEY(numVol) REFERENCES Vol(numVol)" & _
");"   

DoCmd.RunSQL "CREATE TABLE acheter(" & _
   "idPassager VARCHAR(50)," & _
   "numBillet VARCHAR(50)," & _
   "PRIMARY KEY(idPassager, numBillet)," & _
   "FOREIGN KEY(idPassager) REFERENCES Passager(idPassager)," & _
   "FOREIGN KEY(numBillet) REFERENCES Billet(numBillet)" & _
");"   

DoCmd.RunSQL "CREATE TABLE contenir(" & _
   "numBagage VARCHAR(50)," & _
   "numBillet VARCHAR(50)," & _
   "PRIMARY KEY(numBagage, numBillet)," & _
   "FOREIGN KEY(numBagage) REFERENCES Bagage(numBagage)," & _
   "FOREIGN KEY(numBillet) REFERENCES Billet(numBillet)" & _
");"   

DoCmd.RunSQL "CREATE TABLE partir(" & _
   "numVol VARCHAR(50)," & _
   "numPiste VARCHAR(50)," & _
   "PRIMARY KEY(numVol, numPiste)," & _
   "FOREIGN KEY(numVol) REFERENCES Vol(numVol)," & _
   "FOREIGN KEY(numPiste) REFERENCES piste(numPiste)" & _
");"   

DoCmd.RunSQL "CREATE TABLE parcourir(" & _
   "numVol VARCHAR(50)," & _
   "idAvions VARCHAR(50)," & _
   "PRIMARY KEY(numVol, idAvions)," & _
   "FOREIGN KEY(numVol) REFERENCES Vol(numVol)," & _
   "FOREIGN KEY(idAvions) REFERENCES Avions(idAvions)" & _
");"   

DoCmd.RunSQL "CREATE TABLE tacher(" & _
   "numVol VARCHAR(50)," & _
   "idPersonelle VARCHAR(50)," & _
   "id_tache VARCHAR(50)," & _
   "PRIMARY KEY(numVol, idPersonelle, id_tache)," & _
   "FOREIGN KEY(numVol) REFERENCES Vol(numVol)," & _
   "FOREIGN KEY(idPersonelle) REFERENCES personnelle(idPersonelle)," & _
   "FOREIGN KEY(id_tache) REFERENCES tache(id_tache)" & _
");"   

DoCmd.RunSQL "CREATE TABLE consommer(" & _
   "id_ressource VARCHAR(50)," & _
   "id_tache VARCHAR(50)," & _
   "PRIMARY KEY(id_ressource, id_tache)," & _
   "FOREIGN KEY(id_ressource) REFERENCES ressource(id_ressource)," & _
   "FOREIGN KEY(id_tache) REFERENCES tache(id_tache)" & _
");"   

End Sub