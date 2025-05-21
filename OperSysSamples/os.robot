*** Settings ***
Library    OperatingSystem    

*** Variables ***
${outputDir}    outputDirectory
${DirtOne}        fromDirectory
${DirtTwo}        toDirectory
${file1}        index1.html
${file2}        index2.html
${file3}        index3.html    


*** Keywords ***
Create a base dir
       Create Directory    ${outputDir}
       should exist    ${outputDir}

Create source directory
    ${directoryPath}=     Join Path    ${outputDir}     ${DirtOne}
    Create Directory    ${directoryPath}
    should exist     ${directoryPath}
       
Create dest directory
    ${directoryPath}=     Join Path    ${outputDir}     ${DirtTwo}
    Create Directory    ${directoryPath}
    should exist     ${directoryPath}

Create File1
    ${filePath}=     Join Path    ${outputDir}     ${DirtOne}      ${file1}
    Create File    ${filePath}    <h1>Content of file1</h1>
    should exist     ${filePath}
 
Create File2
    ${filePath}=     Join Path    ${outputDir}     ${DirtTwo}      ${file2}
    Create File    ${filePath}    <h1>Content of file1</h1>
    should exist     ${filePath}
    
Create File3
    ${filePath}=     Join Path    ${outputDir}     ${DirtTwo}      ${file3}
    Create File    ${filePath}    <h1>Content of file1</h1>
    should exist     ${filePath}
    
Move File3 from DirtOne to DirtTwo
    ${sourcePath}=    Join path     ${outputDir}     ${DirtTwo}      ${file3}
    ${targetPath}=    Join path    ${outputDir}     ${DirtOne}      ${file3}
    
    Move file     ${sourcePath}    ${targetPath}
    
    Should Exist    ${targetPath}
    Should Not Exist    ${sourcePath}
    
copy File1 from DirtOne to DirtTwo
    ${sourcePath}=    Join path     ${outputDir}     ${DirtOne}      ${file1}
    ${targetPath}=    Join path    ${outputDir}     ${DirtTwo}      ${file1}
    
    copy file    ${sourcePath}    ${targetPath}
    
    should exist    ${sourcePath}
    Should Exist    ${targetPath}
    
    