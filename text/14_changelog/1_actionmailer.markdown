## ActionMailer


 
\* Fixed that a return-path header would be ignored #7572 [joost]
 
\* Less verbose mail logging: just recipients for :info log level; the whole email for :debug only.  #8000 [iaddict, Tarmo Tänav]
 
\* Updated TMail to version 1.2.1 [raasdnil]
 
\* Fixed that you don't have to call super in ActionMailer::TestCase#setup #10406 [jamesgolick]