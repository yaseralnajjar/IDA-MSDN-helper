# IMH
IDA MSDN Helper
Description:
Simply, this tool will help you to get to Offline MSDN help while using IDA Pro.
By selecting a function name or a line that contains it in IDA then pressing Alt+Z, it will automatically open MSDN description for this function.

Files:
IMH.exe   ==> Loader and helper for IDA Pro x86.
IMH_x.exe ==> Loader and helper for IDA Pro x64.

Usage:
1)	Download and install Windows SDK 7
		link: http://www.microsoft.com/en-us/download/details.aspx?id=8279
2)	Download and install H3Viewer
		link: http://visualstudiogallery.msdn.microsoft.com
3)	Check whether you can browse MSDN library through H3Viewer. Otherwise, you may have to download "Win32 and COM Development"
4)	Copy IMH.exe and IMH_x.exe into IDA Pro main folder
5)	You can open IDA Pro using IMH executable files or open IDA then IHM
6)	Select any line that contains a function name then press Alt+Z

Mechanism:
When you select a line that contains a function, such as "call    MessageBoxA", the tool will automatically trim this text into "MessageBox".
It also supports other forms of calling functions like "call    ds:MessageBoxA" or "call    esi ; MessageBoxA ".
