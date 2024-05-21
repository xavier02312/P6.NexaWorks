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

string motCle = Util.ReadLine("Saisissez le Mot clé de Recherche ?");

var result = from t in Tickets.AsNoTracking()
where t.Statut == "résolus" && t.Resolution.Contains(motCle)
select new { t.Resolution};
 result.Dump(); 