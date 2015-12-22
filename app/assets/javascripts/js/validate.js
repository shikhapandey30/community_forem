  $(document).ready(function(){
      // binds form submission and fields to the validation engine
      $("#form-id").validationEngine({
        'custom_error_messages': {
          // Custom Error Messages for Validation Types
          'required': {
            'message': "This field cannot be empty."
          }
          ,'custom[url]': {
            'message': "Please enter valid URL."
          }
          // Custom Error Messages for IDs
          ,'#url' : {
            'custom[url]': {
              'message': "This is an id error. It takes precedence over class and validation type errors."
            }
          }
          ,'#number': {
            'min': {
              'message': "This must be greater than 0!"
            }
          }
          // Custom Error Messages for Classes
          ,'.class_url': {
            'custom[url]': {
              'message': "This is a validation message for a class. It is never called because there" +
                  " is an id error message."
            }
          }
          ,'.class_req': {
            'required': {
              'message': "This is a class message. It takes precedence over validation type error messages."
            }

          }
        }
      });
    });