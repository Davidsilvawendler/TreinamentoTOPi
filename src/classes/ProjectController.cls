@RestResource (urlMapping = '/api/project')
global with sharing class ProjectController {

    @HttpPost
    global static Project__c criate (AgileProject project){
        ProjectTransformer transforme = new ProjectTransformer ();
        ProjectRepository repository = new ProjectRepository ();

        return repository.create (transforme.toProject (project))
    }

    @HttpGet
    global static Project__c getProjects (){

        RestRequest request = RestContest.request;

        RestResponse response = RestContest.response;

        Map <String, String> parameters = request.params;

        String projectId = parameters.get ('Id');
        String projectIds = parameters.get('ids');

        if (String.isEmpty(projectId)){

            response.statusCode = 400;
            response.responseBody = Blob.valueof (new ProjectBusinnesError ('400', 'Invalid Project Id').toString();)
            throw new ProjectException ('Invalid Project Id');
        }

        ProjectRepository repository = new ProjectRepository ();

        response.statusCode = 200;
        response.responseBody = Blob.valueof (JSON.serialize(respository.findById(projectId)));
        
    }

    public class ProjectException extends Exception{}

    global class ProjectBusinnesError{

        String code;
        String message;

        public ProjectBusinnesError (String code, String message){
            this.code = code;
            this.message = message;
        }

        override
        public String toString () {
            return JSON.serialize(this);
        
        }

    }
    
}