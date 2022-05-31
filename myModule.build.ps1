# Synopsis: Build the project.
task Build {
    exec {dotnet build --configuration Release}
    # dotnet build --configuration Release -o 'Release'
}

# Synopsis: Test the project
task Test CSharpTest, PowerShellTest
task CSharpTest {
    exec {dotnet test}
}

task PowerShellTest {
    exec {. (Join-Path $BuildRoot 'ImportAndRun.ps1')}
}
task Remove {
    remove "$BuildRoot\bin"
    remove "$BuildRoot\obj"
}

# Synopsis: Build and clean.
task . Build, Test

