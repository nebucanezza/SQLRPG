$Server = 'localhost'
$connectionString = "Server=$server;Database=TSQlv4; Integrated Security=True";
$conn = New-Object System.Data.SqlClient.SqlConnection $connectionString;

$player = New-Object System.Object;
Add-Member -InputObject $player -MemberType NoteProperty -name player_name -Value '';

$game = New-Object System.Object;
Add-Member -InputObject $game -MemberType NoteProperty -name game_difficult -Value "Easy"; 

$player.player_name =  Read-Host -Prompt "Bitte geben Sie den Spielernamen ein" ;


try {
        $conn.open();
        if($conn.State -eq "Open")
        {
        Write-Host 'Verbindung erfolgreich getestet';
        Write-Host 'Testabfrage wird durchgeführt...... ';
        $Query = 'SELECT * FROM [HR].[Employees]';
        $Befehl = $conn.CreateCommand();
        $Befehl.CommandText = $Query;
        $Result = $Befehl.ExecuteReader();
        $Tablle = New-Object System.Data.DataTable;
        $Tablle.Load($Result);
        $Tablle.GetList();
        }
        $conn.Close();
        Write-Host "Sie spielen mit Player : "  $player.player_name;
    }
catch {
    Write-Host $_.Exception.Message;
}