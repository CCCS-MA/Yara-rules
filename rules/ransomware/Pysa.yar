rule Pysa
{
meta:
	description = "Identifies Pysa aka Mespinoza ransomware."
	author = "@bartblaze"
	date = "2021-03"
	tlp = "White"

strings: 
	$code = { 8a 0? 41 84 c0 75 ?? 2b ce 8b 35 ?? ?? ?? ?? 8d 41 01 50 5? 6a 07 6a 00 68 ?? ?? ?? 
	?? ff 7? ?? ff d? 6a 05 68 ?? ?? ?? ?? 6a 07 6a 00 68 ?? ?? ?? ?? ff 7? ?? ff d? ff 7? ?? ff 
	15 ?? ?? ?? ?? 8b 4? ?? 33 cd 5e e8 ?? ?? ?? ?? 8b e5 5d c3 }

	$s1 = "n.pysa" ascii wide fullword
	$s2 = "%s\\Readme.README" ascii wide 
	$s3 = "Every byte on any types of your devices was encrypted." ascii wide 

condition:
	$code or 2 of ($s*)
}
