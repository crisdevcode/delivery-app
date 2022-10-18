
   class EmailFormValidator {
     static String? validateEmail({ required String email })  {
       String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
       RegExp regExp  = new RegExp(pattern);

       return regExp.hasMatch(email) ? null : 'El email no es válido';
     }
   }

   class PasswordFormValidator {
     static String? validatePassword({ required String password }) {
       return password.isNotEmpty && password.length >= 6 ? null : 'La password no es correcta';
     }
   }

   class DefaultFormValidator {
     static String? validateIsNotEmpty({ required String value }) {
       return value.isNotEmpty ? null : 'El campo está vacío';
     }
   }


