global class TestResponsegenerator implements HttpCalloutMock 
{
                   

    // Implement this interface method
    global HTTPResponse respond(HttpRequest req)
 {
  HttpResponse res=new HttpResponse();
  res.setHeader('Content-Type', 'application/json');
  res.setBody('{"isSuccess":"true"  "Id":"00Q9000000WGZHa"  "status":"success"}');
  res.setStatusCode(200);
  return res;
    } 
}