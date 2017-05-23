SqrlOnRails.setup do |config|

  # The Server Friendly Name is the commonly known name of the website, for quick and easy
  # recognition by SQRL users. For example, whereas Amazon's full domain name is
  # www.amazon.com, they are known as Amazon, so their SFN would doubtless be “Amazon”.
  # Similarly, www.wordpress.com would use “Wordpress” and www.ebay.com would use “eBay”.

  # It is present on all SQRL links, and a mismtach during communication with the client
  # will trigger an immediate fail.
  # So make sure your users can recognize your site by this name.
  config.sfn = 'Your Site'
end
