## Details

The main focus of Rails changes was Ruby 1.9, even minor details were analyzed to make Rails the more compatible possible with the new Ruby version. Details like changing from **File.exists?** to **File.exist?** were not kept aside.

Also, in Ruby 1.9, the module **Base64** (base64.rb) was removed, because of that, all references to it were replaced by **ActiveSupport::Base64**.
