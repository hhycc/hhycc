�L�ASP(���&�����)�ϴ� [2006-11-30]

���µ����������ַ�ǣ�http://www.zope.org/Members/Rimifon/FyUpload.sct����Ҫ���°汾����������ļ���������ʱ��
������ᾡ��ͬ�����·������й�վ��վ��www.chinaz.com����

������ϴ���
	��һ��ʹ����Ҫ�Ҽ���FyUpload.sct���ļ� - ע��
	��������Set Upload = Server.CreateObject("Rimifon.Upload")

������ϴ���
	��������Set Upload = GetObject("script:�����ַ#Upload")
	�����ַΪӲ�̾���·����Ҳ����Ϊhttp����·��(���IIS 5.0)

�򵥲��Դ��룺
/-*- Upload.html -*-/
<form method=post action=Upload.asp enctype=multipart/form-data>
<input name=MyFile type=file>
<input type=submit></form>

/-*- Upload.asp -*-/
<%Set Upload = Server.CreateObject("Rimifon.Upload")
Upload.ReadForm 204800	' ���û�������С��Windows 2003Ĭ�ϲ�������204800��������ϴ�ʧ�ܡ�
Upload.SaveFile		' �����ļ�����ǰĿ¼�����豣�浽UploadĿ¼�£���ʹ��SaveFile "Upload"
Upload.Dispose		' �ͷ��ڴ�
Set Upload = Nothing%>

������ϸ���Ժͷ�����
Upload.Charset	' ��ҳ�����Ϊutf-8ʱ�����ø�ֵΪ"UTF-8"��Ĭ��Ϊ"gb2312"
Upload.Filter	' ���������ϴ����ļ����ͣ�Ĭ��Ϊ��rar|zip|txt|gif|jpg|bmp|htm|html|swf|mht����Ϊ���������κθ�ʽ�ļ��ϴ���
Upload.MaxSize	' ���õ����ļ������ϴ�������С��Bytes�����粻������Ϊ0��Ĭ��Ϊ0��
Upload.Field	' �ͻ����ύ�ı�Ԫ�أ�
			����ı�Ԫ�أ�Upload.Field.test.Value	' ������Ԫ��"test"��ֵ
			����ļ�Ԫ�أ�
				Upload.Field.MyFile.FilePath	' �����ļ��ڿͻ��˵�λ��
				Upload.Field.MyFile.SourceName	' �����ļ���Դ�ļ���
				Upload.Field.MyFile.FileName	' �ļ������ڷ��������ļ���
				Upload.Field.MyFile.FileSize	' �����ļ���С
				Upload.Field.MyFile.FileType	' �����ļ���Mime����
				Upload.Field.MyFile.SavePath	' ��ȡ�����ø��ļ�����λ�õľ���·��
				Upload.Field.MyFile.Message	' �������ܾ����ļ�ʱ���ص���Ϣ
				Upload.Field.MyFile.Value	' �ļ����ݣ�unicode�ַ���
				�����ݿ�ʱֱ��ʹ��rs("FileData").AppendChunk Upload.Field.MyFile.Value�ķ�ʽ����
Upload.Form("test")	' ���ر�Ԫ��"test"��ֵ����Upload.Field.test.Value�ļ򻯶�ȡ��ʽ����������"test"Ԫ��ʱ���ؿ�ֵ��
Upload.ReadForm FormSize, ProgID
			��ȡ����FormSizeΪ��������С��Ĭ��Ϊ0���Ƽ���204800���£��ɽ��2003�²����ϴ����ļ������⣩��
			�ṩ����2(ProgID)��Ϊ�ϴ��ṩ�������ݣ�Application������Ҫ�ϴ�������ʱ���õ����������
				���ļ���С��Application(ProgID + "_TotalBytes")
				���ϴ���������Application(ProgID + "_ReadBytes")
				������ͳ����Ϻ󣬽������������������Application.Contents.Remove(ProgID + "_TotalBytes")
Upload.SaveFile SavePath
			�����ļ�����ǰĿ¼��SavePath����Ŀ¼������ڣ��£�Ĭ��Ϊ��ǰĿ¼��
Upload.Dispose		�ͷ��ڴ�

�������룺
	Test_00.asp	vbs(asp) ���ü�ʾ��
	Test_01.asp	ָ������λ�ò���