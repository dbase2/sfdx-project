public class SystemTools {
    public static Boolean isTest(){
        return [select Id, IsSandbox from Organization][0].IsSandbox;
    }
    public static void securityTesting(){
        List<Account> accs = new List<Account>();

        Account acc = new Account();
        acc.Name = 'test';

        accs.add(acc);

        system.debug('account id before insert: ' + acc.id);

        SObjectAccessDecision securityDecision = Security.stripInaccessible(AccessType.CREATABLE, accs);
        
        System.debug('Accounts number: ' + [Select Id from Account].size());

        insert (accs = securityDecision.getRecords());
        
        System.debug('Accounts number2: ' + [Select Id from Account].size());

        system.debug('account id after insert: ' + acc.id);
        
        system.debug('account list id after insert: ' + accs[0].id);
        
        System.debug('Account id: ' + [Select Id from Account].Id);
        
        System.debug('===============================');
        
        Account accx = new Account();
        accx.name = 'sumName';
        insert accx;
        
        System.debug('id of accx: ' + accx.id);
        
    }

    public static void parameterTesting1(){
        String s = 'fun';
        parameterTesting2(s);
    }
    public static void parameterTesting2(String s){
        parameterTesting3(s);
        System.debug(s);
    }
    public static void parameterTesting3(String s){
        s = 'lelelelelel';
    }
    public static void queryTesting(){
        Account acc = new Account();
        acc.name = 'MyFriend_1';
        insert acc;

        System.debug([Select Id from Account where name = 'MyFriend__1'].size());
        System.debug([Select Id from Account where name = 'MyFriend__%'].size());
        System.debug([Select Id from Account where name LIKE 'MyFriend__1'].size());
        System.debug([Select Id from Account where name LIKE 'MyFriend__2'].size());
        System.debug([Select Id from Account where name LIKE 'MyFriend__'].size());
        System.debug([Select Id from Account where name LIKE 'MyFriend__%'].size());
    }

    public static string fun(){
        return 'lelele';
    }

    public static void stringTesting(){
        String s = '';
        Decimal dec = Decimal.valueOf(s);
        System.debug(dec);
    }

    public static List<Account> returnList(){
        list<Account> accs = new List<Account>();
        Account acc = new Account();
        acc.name = 'fun';
        null;
        accs.add(acc);

        return accs;

     
            
            Test.startTest();
            System.runAs(contextuser){
                
            }
            Test.stopTest();
            
        }
    }
}