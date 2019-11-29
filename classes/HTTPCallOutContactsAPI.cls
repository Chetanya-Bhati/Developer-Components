public class HTTPCallOutContactsAPI {
	Public void ConatactsAPI(){
        //HTTP Request Method
        HTTPRequest Req = New HTTPRequest();
        Req.setMethod('GET');
        Req.setEndpoint(Label.ConatctsAPI);
        
        //HTTP Method
        HTTP httpParam = New HTTP();
        //HTTP Response Method
		HTTPResponse Res = httpParam.send(Req);
        String strResponse = Res.getBody();
        System.debug('HTTP API Contacts ----> ' + strResponse);
    }
}