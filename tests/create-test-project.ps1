$test_project_source = (Get-Item $PSScriptRoot).GetDirectories("test-project")
if ($test_project_source.GetDirectories("build").Exists) {
    Write-Output "Removing existing build dir"
    Remove-Item $test_project_source.GetDirectories("build").FullName -Recurse;
}
Write-Output "Creating a new build dir"
$test_project_source.CreateSubdirectory("build") | Out-Null
$build_folder = $test_project_source.GetDirectories("build")
conan install --install-folder $build_folder.FullName `
    --settings build_type=Debug `
    $test_project_source.GetFiles("conanfile.py").FullName

$MP = $build_folder.FullName.Replace('\','/')
$MP = "-DCMAKE_MODULE_PATH=$MP"
# Write-Output $MP
cmake -S $test_project_source -B $build_folder.FullName $MP
cmake --build $build_folder.FullName
