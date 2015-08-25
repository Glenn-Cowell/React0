
<!--#include virtual="/include/egrpDSN_binary.inc"-->
<%
	LVL_CD = Request("LVL_CD")
	PMENU_ID = Request("MENU_ID")
	LVL_CD = len(PMENU_ID)+1
	session.CodePage = 65001
	response.charset = "utf-8"
	set Rs = Server.CreateObject("Adodb.Recordset")
	set RsSub1 = Server.CreateObject("Adodb.Recordset")
	set RsSub2 = Server.CreateObject("Adodb.Recordset")
	set RsSub3 = Server.CreateObject("Adodb.Recordset")
	sSQL = "SELECT a.LVL_CD, a.MENU_ID, a.MENU_CNM, a.PMENU_ID, isnull(b.ASP_ENM,'') as asp_enm  FROM dbo.TRMENU a "
	sSQL = sSQL & " LEFT OUTER JOIN dbo.TRMENUASP b ON a.MENU_ID = b.MENU_ID and b.MA_SQ = 1 "
	sSQL = sSQL & " WHERE LEFT(a.menu_id,2)<>'NI' "
	sSQL = sSQL & " and a.menu_id in (select left(menu_id,len(a.menu_id)) from trmenuasp) "
	sSQL = sSQL & " and a.LVL_CD = '"&LVL_CD&"' and a.PMENU_ID='"&PMENU_ID&"' ORDER BY a.MENU_ID"
	Rs.open sSQL,egrpDSN,1,1
	cnt = 0
	if rs.eof then
		response.write "null"
	else
		'response.write "{ ""menu"":["
			response.write "["
		do until Rs.eof
			cnt = cnt + 1
			if cnt > 1 then response.write ","
			LVL_CD = trim(Rs("LVL_CD"))
			MENU_ID = trim(Rs("MENU_ID"))
			MENU_CNM = trim(Rs("MENU_CNM"))
			PMENU_ID = trim(Rs("PMENU_ID"))
			asp_enm = trim(Rs("asp_enm"))

			response.write "{"

			response.write """MENU_NO"":"""&MENU_ID&""","
			response.write """MENU_NM"":"""&MENU_CNM&""","

			response.write """url"":"""&asp_enm&""""
			response.write "}"
			rs.movenext
		loop
		response.write "]"
		'response.write "]}"
	end if
	rs.close
	set RsSub1 = nothing
	set rs = nothing
%>
