using System;
using System.Configuration;

/// <summary>
/// Repository for BalloonShop configuration settings
/// </summary>
public static class Configuration
{
  
  // Store the name of your shop
  private readonly static string siteName;

  // Initialize various properties in the constructor
  static Configuration()
  {
    siteName = ConfigurationManager.AppSettings["SiteName"];
  }



  // Returns the address of the mail server
  public static string MailServer
  {
    get
    {
      return ConfigurationManager.AppSettings["MailServer"];
    }
  }

  // Send error log emails?
  public static bool EnableErrorLogEmail
  {
    get
    {
      return bool.Parse(ConfigurationManager.AppSettings["EnableErrorLogEmail"]);
    }
  }

  // Returns the email address where to send error reports
  public static string ErrorLogEmail
  {
    get
    {
      return ConfigurationManager.AppSettings["ErrorLogEmail"];
    }
  }

  // Returns the length of product descriptions in products lists
  public static string SiteName
  {
    get
    {
      return siteName;
    }
  }

 
}
