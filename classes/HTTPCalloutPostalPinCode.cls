public class HTTPCalloutPostalPinCode {
	Public void PostalBranchInCity(){
        //HTTP Request Method
        HTTPRequest Req = New HTTPRequest();
        Req.setMethod('GET');
        Req.setEndpoint(Label.PostOfficeInBranch);
        
        //HTTP Method
        HTTP httpParam = New HTTP();
        //HTTP Response Method
		HTTPResponse Res = httpParam.send(Req);
        String strResponse = Res.getBody();
        System.debug('HTTP API POst Offices within City ----> ' + strResponse);
    }
}