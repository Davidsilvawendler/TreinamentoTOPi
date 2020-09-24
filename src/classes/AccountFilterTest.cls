@isTest
public class AccountFilterTest {

    @isTest
    static void filterAccountsByDocumentNumberTest(){

        Map<String, SObject> records = AccountFixtureFactory.createIntegratedScenario();

        List <Account> account = new List <Account> {
            (Account) records.get('account')
        };

        AccountFilter filter = new AccountFilter ();

        List <Account> filteredAccounts = filter. filterAccountsByDocumentNumber (accounts, null);

        filteredAccounts = filter.filterAccountsByDocumentNumber (accounts, new Map<Id, Account>());

        System.assertEquals (accounts.size(), filteredAccounts.size());

        Map<Id, Account> oldAccounts = new Map<Id, Account> (accounts);

        Account changedAccount = accounts.get(0). clone (true, true, true, true);
        changedAccount.DocumentNumber__c = 'X';
        oldAccounts.put (changedAccount.Id, changedAccount);

        filteredAccounts = filter. filterAccountsByDocumentNumber(accounts, oldAccounts);

        System.assertNotEquals (accounts.size(), filteredAccounts.size());
        System.assert (filteredAccounts.size() == 1);

        accounts = new List<Account>();
        accounts.add (new Account(Name = 'Teste 01'));
        accounts.add (new Account(Name = 'Teste 02'));

        filteredAccounts = filter.filterAccountsByDocumentNumber(accounts, null);

        System.assert (filteredAccounts.isEmpty());

    }

    @isTest
    static void givenCategoryAndRevenueEmptyWhenInsertReturnEmptyList() {
        Map<String, SObject> records = AccountFixtureFactory.createIntegratedScenario();

        List<Account> accounts = new List<Account>{
            (Account) records.get('emptyCategoryAndRevenue')
        };

        AccountFilter filter = new AccountFilter();
        
        List<Account> filteredAccounts = filter.filterByCategoryPremiumAndMillionAnnualRevenue(accounts);

        System.assertNotEquals(accounts.size(), filteredAccounts.size() );
        System.assert(filteredAccounts.size() == 0);
    }

    @isTest
    static void givenCategoryStandardWhenInsertReturnEmptyList() {
        Map<String, SObject> records = AccountFixtureFactory.createIntegratedScenario();

        List<Account> accounts = new List<Account>{
            (Account) records.get('categoryStandard')
        };

        AccountFilter filter = new AccountFilter();
        
        List<Account> filteredAccounts = filter.filterByCategoryPremiumAndMillionAnnualRevenue(accounts);

        System.assertNotEquals(accounts.size(), filteredAccounts.size() );
        System.assert(filteredAccounts.size() == 0);
    }

    @isTest
    static void givenCategoryPremiumAndRevenueUnderMilliondWhenInsertReturnEmptyList() {
        Map<String, SObject> records = AccountFixtureFactory.createIntegratedScenario();

        List<Account> accounts = new List<Account>{
            (Account) records.get('premiumUnderMillion')
        };

        AccountFilter filter = new AccountFilter();
        
        List<Account> filteredAccounts = filter.filterByCategoryPremiumAndMillionAnnualRevenue(accounts);

        System.assertNotEquals(accounts.size(), filteredAccounts.size() );
        System.assert(filteredAccounts.size() == 0);
    }

    @isTest
    static void givenCategoryPremiumAndRevenueOverMilliondWhenInsertReturnAccounts() {
        Map<String, SObject> records = AccountFixtureFactory.createIntegratedScenario();

        List<Account> accounts = new List<Account>{
            (Account) records.get('premiumOverMillion')
        };

        AccountFilter filter = new AccountFilter();
        
        List<Account> filteredAccounts = filter.filterByCategoryPremiumAndMillionAnnualRevenue(accounts);

        System.assertEquals(accounts.size(), filteredAccounts.size() );
    }


}