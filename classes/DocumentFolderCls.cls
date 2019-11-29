Public Class DocumentFolderCls{

    Public void AccessDoc(){
    //List <Document> Docs = [select id, name, body from Document where id = '0157F000001crd5'];
    Document Doc = [select id, name, body from Document where id = '0157F000001crd5'];
    String strBody = '';
    strBody = EncodingUtil.base64Encode(Doc.body);
    System.Debug('Document strBody -> ' + strBody);
    }
    
    Public void AddDoc(){
    Document Doc2 = New Document();
    Doc2.Body = Blob.valueOf('Some Text');
    Doc2.ContentType = 'application/msword';
    Doc2.DeveloperName = 'my_document';
    Doc2.IsPublic = true;
    Doc2.Name = 'My pdf Document';
    Doc2.FolderId = [select id from folder where name = 'My Test'].id;
    insert Doc2;
    }
    
}