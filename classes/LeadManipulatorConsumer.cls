public class LeadManipulatorConsumer 
{
	public static String SERVER_URL, SESSION_ID;
	/*
	public static void login()
    {
        String LOGIN_DOMAIN = 'login'; 
        String USERNAME = 'inglesumit1991@gmail.com';
        String PASSWORD = 'rana12345';
        
        Http h = new Http(); 
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://' + LOGIN_DOMAIN + '.salesforce.com/services/Soap/u/28.0');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'text/xml;charset=UTF-8');
        request.setHeader('SOAPAction', '""');
        request.setBody('<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/"><Header/><Body><login xmlns="urn:partner.soap.sforce.com"><username>' + USERNAME + '</username><password>' + PASSWORD + '</password></login></Body></Envelope>');
        
        HttpResponse response = h.send(request);
        system.debug('----Response Body-----'+response.getBody());
        
        Dom.XmlNode resultElmt = response.getBodyDocument().getRootElement()
        .getChildElement('Body','http://schemas.xmlsoap.org/soap/envelope/')
        .getChildElement('loginResponse','urn:partner.soap.sforce.com')
        .getChildElement('result','urn:partner.soap.sforce.com');
        
        SERVER_URL = resultElmt.getChildElement('serverUrl','urn:partner.soap.sforce.com').getText().split('/services')[0];
        SESSION_ID = resultElmt.getChildElement('sessionId','urn:partner.soap.sforce.com').getText();
        
        system.debug('--SERVER_URL---'+SERVER_URL);
        system.debug('--SESSION_ID---'+SESSION_ID);
    }
    */
    public static HttpResponse createLeadC(String fName,String lName,String email,String phone)
    {
    	//login();
    	String domain = 'ap1';
   		Http h = new Http(); 
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint('https://' + domain + '.salesforce.com/services/apexrest/LeadManipulatorService');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization','OAuth '+SESSION_ID);
        
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();
        gen.writeStringField('firstName', fName);
        gen.writeStringField('lastName', lName);
        gen.writeStringField('email', email);
        gen.writeStringField('phone', phone);
        gen.writeEndObject();
        
        String body = gen.getAsString();
        request.setBody(body);
        
        HttpResponse response = h.send(request);
        
        System.debug('---------'+response.getBody());
        return response;
    }
    
    public  static HttpResponse  deleteLeadC(String fName,String lName,String email,String phone)
    {
    	//login();
    	String domain = 'ap1';
   		Http h = new Http(); 
        HttpRequest request = new HttpRequest();
        String endpoint ;
        
        //request.setEndpoint('https://' + domain + '.salesforce.com/services/apexrest/LeadManipulatorService');
        endpoint = 'https://' + domain + '.salesforce.com/services/apexrest/LeadManipulatorService/?';
        endpoint += 'firstName='+fName+'lastName='+lname+'email='+email+'phone='+phone;
        request.setEndpoint(endpoint);
        request.setMethod('DELETE');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization','OAuth '+SESSION_ID);
        
        /*JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();
        gen.writeStringField('firstName', fName);
        gen.writeStringField('lastName', lName);
        gen.writeStringField('email', email);
        gen.writeStringField('phone', phone);
        gen.writeEndObject();
        
        String body = gen.getAsString();
        
        request.setBody(body);*/
        
        HttpResponse response = h.send(request);
        
        System.debug('---------'+response.getBody());
        return response;
    }
    
    public  static HttpResponse  updateLeadC(String fName,String lName,String email,String phone)
    {
    	//login();
    	String domain = 'ap1';
   		Http h = new Http(); 
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint('https://' + domain + '.salesforce.com/services/apexrest/LeadManipulatorService');
        request.setMethod('PATCH');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization','OAuth '+SESSION_ID);
        
        JSONGenerator gen = JSON.createGenerator(true);
        gen.writeStartObject();
        gen.writeStringField('firstName', fName);
        gen.writeStringField('lastName', lName);
        gen.writeStringField('email', email);
        gen.writeStringField('phone', phone);
        gen.writeEndObject();
        
        String body = gen.getAsString();
        request.setBody(body);
        
        HttpResponse response = h.send(request);
        
        System.debug('---------'+response.getBody());
  return response;
    }   
}