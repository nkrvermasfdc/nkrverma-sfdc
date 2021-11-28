//Generated by wsdl2apex

public class AsyncCalculatorServices_old {
    public class doDivideResponseFuture extends System.WebServiceCalloutFuture {
        public Double getValue() {
            calculatorServices_old.doDivideResponse response = (calculatorServices_old.doDivideResponse)System.WebServiceCallout.endInvoke(this);
            return response.return_x;
        }
    }
    public class doSubtractResponseFuture extends System.WebServiceCalloutFuture {
        public Double getValue() {
            calculatorServices_old.doSubtractResponse response = (calculatorServices_old.doSubtractResponse)System.WebServiceCallout.endInvoke(this);
            return response.return_x;
        }
    }
    public class doMultiplyResponseFuture extends System.WebServiceCalloutFuture {
        public Double getValue() {
            calculatorServices_old.doMultiplyResponse response = (calculatorServices_old.doMultiplyResponse)System.WebServiceCallout.endInvoke(this);
            return response.return_x;
        }
    }
    public class doAddResponseFuture extends System.WebServiceCalloutFuture {
        public Double getValue() {
            calculatorServices_old.doAddResponse response = (calculatorServices_old.doAddResponse)System.WebServiceCallout.endInvoke(this);
            return response.return_x;
        }
    }
    public class AsyncCalculatorImplPort {
        public String endpoint_x = 'https://th-apex-soap-service.herokuapp.com/service/calculator';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://calculator.services/', 'calculatorServices'};
        public AsyncCalculatorServices_old.doDivideResponseFuture beginDoDivide(System.Continuation continuation,Double arg0,Double arg1) {
            calculatorServices_old.doDivide request_x = new calculatorServices_old.doDivide();
            request_x.arg0 = arg0;
            request_x.arg1 = arg1;
            return (AsyncCalculatorServices_old.doDivideResponseFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncCalculatorServices_old.doDivideResponseFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://calculator.services/',
              'doDivide',
              'http://calculator.services/',
              'doDivideResponse',
              'calculatorServices.doDivideResponse'}
            );
        }
        public AsyncCalculatorServices_old.doSubtractResponseFuture beginDoSubtract(System.Continuation continuation,Double arg0,Double arg1) {
            calculatorServices_old.doSubtract request_x = new calculatorServices_old.doSubtract();
            request_x.arg0 = arg0;
            request_x.arg1 = arg1;
            return (AsyncCalculatorServices_old.doSubtractResponseFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncCalculatorServices_old.doSubtractResponseFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://calculator.services/',
              'doSubtract',
              'http://calculator.services/',
              'doSubtractResponse',
              'calculatorServices.doSubtractResponse'}
            );
        }
        public AsyncCalculatorServices_old.doMultiplyResponseFuture beginDoMultiply(System.Continuation continuation,Double arg0,Double arg1) {
            calculatorServices_old.doMultiply request_x = new calculatorServices_old.doMultiply();
            request_x.arg0 = arg0;
            request_x.arg1 = arg1;
            return (AsyncCalculatorServices_old.doMultiplyResponseFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncCalculatorServices_old.doMultiplyResponseFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://calculator.services/',
              'doMultiply',
              'http://calculator.services/',
              'doMultiplyResponse',
              'calculatorServices.doMultiplyResponse'}
            );
        }
        public AsyncCalculatorServices_old.doAddResponseFuture beginDoAdd(System.Continuation continuation,Double arg0,Double arg1) {
            calculatorServices_old.doAdd request_x = new calculatorServices_old.doAdd();
            request_x.arg0 = arg0;
            request_x.arg1 = arg1;
            return (AsyncCalculatorServices_old.doAddResponseFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncCalculatorServices_old.doAddResponseFuture.class,
              continuation,
              new String[]{endpoint_x,
              '',
              'http://calculator.services/',
              'doAdd',
              'http://calculator.services/',
              'doAddResponse',
              'calculatorServices.doAddResponse'}
            );
        }
    }
}