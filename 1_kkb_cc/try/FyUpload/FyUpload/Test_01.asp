<%@language="Javascript" codepage="936"%><html><head><%
var arrInfo = new Array;
if(Request.ServerVariables("Request_Method").Item == "POST")
{
	var Upload = GetObject("Script:" + Server.MapPath("FyUpload.sct"));
	Upload.ReadForm(200 * 1024);
	/* ָ��file_01�ı���λ��ΪC:\���ļ���Ϊ�ϴ�ǰ���ļ��� */
	Upload.Field.file_01.SavePath = "C:\\" + Upload.Field.file_01.SourceName;
	Upload.SaveFile(); // δָ������λ�õ�ʹ��Ĭ�ϱ���·����
	for(var i in Upload.Field)
	{
		if(Upload.Field[i].Message) arrInfo.push(Upload.Field[i].Message);
	}
	Upload.Dispose();
}
%><title>�ļ��ϴ�</title></head><body>
<form method="post" enctype="multipart/form-data">
<p><%=arrInfo.join("<br>").fontcolor("red")%></p>
<input type="file" name="file_01"><br>
<input type="file" name="file_02"><br>
<input type="file" name="file_03"><br>
<input type="file" name="file_04"><br>
<input type="submit">
</form></body></html>