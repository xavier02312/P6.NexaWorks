<Query Kind="Statements">
  <Connection>
    <ID>1358fa2e-5367-497b-9d19-2d07c6c26ffe</ID>
    <NamingServiceVersion>2</NamingServiceVersion>
    <Persist>true</Persist>
    <Driver Assembly="(internal)" PublicKeyToken="no-strong-name">LINQPad.Drivers.EFCore.DynamicDriver</Driver>
    <Server>localhost</Server>
    <AllowDateOnlyTimeOnly>true</AllowDateOnlyTimeOnly>
    <Database>P6BDD</Database>
    <DriverData>
      <EFProvider>Microsoft.EntityFrameworkCore.SqlServer</EFProvider>
      <ExtraCxOptions>trustservercertificate=True</ExtraCxOptions>
      <EncryptSqlTraffic>True</EncryptSqlTraffic>
      <PreserveNumeric1>True</PreserveNumeric1>
    </DriverData>
  </Connection>
</Query>

string produitId = Util.ReadLine("Saisissez le Code Produit ?");
string versionId = Util.ReadLine("Saisissez le Code Version ?");
string DateDebut = Util.ReadLine("Saisissez la Date de Debut: (AAAA/MM/JJ)");
string DateFin = Util.ReadLine("Saisissez la Date de Fin: (AAAA/MM/JJ)");

var result = from t in Tickets.AsNoTracking()
where t.ProduitId.ToString() == produitId && t.VersionId.ToString() == versionId && t.Statut == "résolus" && 
		t.DateDeResolution >= DateOnly.Parse(DateDebut) && t.DateDeResolution <= DateOnly.Parse(DateFin)
select new { 
			t.Resolution,
			t.ProduitId,
			t.VersionId,
			t.DateDeResolution};
 result.Dump();