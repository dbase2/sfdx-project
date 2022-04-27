@isTest
public class SecurityTesting2 {
   @isTest
   public static void testSecurity1(){
       User usr = [Select id from user where alias='test'];

       system.runAs(usr){
         List<Account> accs = new list<Account>();

          Account acc = new Account();
          acc.name='testAccount';

          accs.add(acc);

          SObjectAccessDecision securityDecision = security.stripInaccessible(AccessType.CREATABLE, accs);
          

          try{
          insert securityDecision.getRecords();
          } catch(exception e){
             system.debug(e.getMessage());
          }
          System.assertEquals([Select id from Account].size(), 1);
       }
   }
   @isTest
   public static void testSecurity2(){

      List<Account> accs = new list<Account>();

      Account acc = new Account();
      acc.name='testAccount';

      accs.add(acc);

      SObjectAccessDecision securityDecision = security.stripInaccessible(AccessType.CREATABLE, accs);
      

      try{
      insert securityDecision.getRecords();
      } catch(exception e){
         system.debug(e.getMessage());
      }
      System.assertEquals([Select id from Account].size(), 1);
   }

   @isTest
   public static void testSecurity3(){
      User usr = [Select id from user where alias='test'];

      system.runAs(usr){
        List<Account> accs = new list<Account>();

         Account acc = new Account();
         acc.name='testAccount';
         acc.Active__c = 'yes';


         accs.add(acc);

         SObjectAccessDecision securityDecision = security.stripInaccessible(AccessType.READABLE, accs);
         

         try{
         insert securityDecision.getRecords();
         } catch(exception e){
            system.debug(e.getMessage());
         }
         System.assertEquals([Select id from Account].size(), 1);
      }
  }

  @isTest
   public static void testSecurity4(){
      User usr = [Select id from user where alias='test'];

      system.runAs(usr){
       
         [Select id from Bear__c WITH SECURITY_ENFORCED].size();
      }

  }
  @isTest
   public static void testSecurity5(){
      User usr = [Select id from user where alias='test'];

      system.runAs(usr){
       
         [Select id, Active__c from Account WITH SECURITY_ENFORCED].size();
      }
  }
}
