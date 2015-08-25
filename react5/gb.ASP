<!--#include virtual="/include/egrpDSN_binary.inc"-->
<%
	qname = Request("name")
	qcntent = Request("cntent")
	qtime = Request("time")
	session.CodePage = 65001
	response.charset = "utf-8"
	set Rs = Server.CreateObject("Adodb.Recordset")
	sSQL = "select Name,DT,TextBox from GuestBook order by dt"
	Rs.open sSQL,egrpDSN,3,3
	cnt = 0
	if qname <> "" OR qTextBox <> "" then
		rs.addnew
		rs("Name") = qname
		rs("DT") = now
		rs("TextBox") = qcntent
		rs.update
	end if
	if not rs.eof then
		rs.MoveFirst
		response.write "["
		do until Rs.eof
			cnt = cnt + 1
			if cnt > 1 then response.write ","
			name = trim(Rs("name"))
			DT = trim(Rs("DT"))
			TextBox = trim(Rs("TextBox"))

			response.write "{""name"":"""&name&""","
			response.write """time"":"""&DT&""","
			response.write """cntent"":"""&TextBox&"""}"
			rs.movenext
		loop
		response.write "]"
	end if
%>
