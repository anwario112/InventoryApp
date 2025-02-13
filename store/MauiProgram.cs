
using Microsoft.Extensions.Logging;
using store.Data;
using UraniumUI;
using CommunityToolkit.Maui;
using System.Diagnostics;
using Microsoft.EntityFrameworkCore;
using static System.Runtime.InteropServices.Marshalling.IIUnknownCacheStrategy;
using store.Models;




namespace store
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            //create database
            InitializeDatabase();


            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .UseUraniumUI()
                .UseUraniumUIMaterial()
                .UseMauiCommunityToolkit()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                    fonts.AddFont("OPTITimes-Roman.otf", "roman");
                });

#if DEBUG
            builder.Logging.AddDebug();
#endif

            return builder.Build();
        }


        private static async void InitializeDatabase()

        {

            using (var dbContext = new DBContext())

            {

                try

                {

                    dbContext.Database.EnsureCreated();

                    Debug.WriteLine("Database initialized and tables created.");



                



                    var ExportedCard = await dbContext.ExportedCard.ToListAsync();

                    if (ExportedCard != null && ExportedCard.Count > 0)

                    {

                        Debug.WriteLine("The ExportedCard table exists and has data.");

                    }

                    else

                    {

                        Debug.WriteLine("The ExportedCard table does not exist or is empty.");

                    }






                    var ExportedSection = await dbContext.ExportedSection.ToListAsync();

                    if (ExportedSection != null && ExportedSection.Count > 0)

                    {

                        Debug.WriteLine("The ExportedSection table exists and has data.");

                    }

                    else

                    {

                        Debug.WriteLine("The ExportedSection table does not exist or is empty.");

                    }






                    var ExportedRak = await dbContext.ExportedRak.ToListAsync();

                    if (ExportedRak != null && ExportedRak.Count > 0)

                    {

                        Debug.WriteLine("The ExportedRak table exists and has data.");

                    }

                    else

                    {

                        Debug.WriteLine("The ExportedRak table does not exist or is empty.");

                    }


                    var user = await dbContext.User.ToListAsync();

                    if (user != null && user.Count > 0)

                    {

                        Debug.WriteLine("The ItemCardArchive table exists and has data.");

                    }

                    else

                    {

                        Debug.WriteLine("The ItemCardArchive table does not exist or is empty.");

                    }


                    var Archive = await dbContext.ItemArchive.ToListAsync();

                    if (Archive != null && Archive.Count > 0)

                    {

                        Debug.WriteLine("The ItemCardArchive table exists and has data.");

                    }

                    else

                    {

                        Debug.WriteLine("The ItemCardArchive table does not exist or is empty.");

                    }








                    var export = await dbContext.ItemFile.ToListAsync();

                    if (export != null && export.Count > 0)

                    {

                        Debug.WriteLine("The Items table exists and has data.");

                    }

                    else

                    {

                        Debug.WriteLine("The Items table does not exist or is empty.");

                    }


                    var itembarcode= await dbContext.ItemBarcode.ToListAsync();

                    if (itembarcode != null && itembarcode.Count > 0)

                    {

                        Debug.WriteLine("The Items table exists and has data.");

                    }

                    else

                    {

                        Debug.WriteLine("The Items table does not exist or is empty.");

                    }



                    var itemUnit = await dbContext.ItemUnit.ToListAsync();

                    if (itemUnit != null && itemUnit.Count > 0)

                    {

                        Debug.WriteLine("The Items table exists and has data.");

                    }

                    else

                    {

                        Debug.WriteLine("The Items table does not exist or is empty.");

                    }



                    var connections = await dbContext.Connections.ToListAsync();

                    if (connections != null && connections.Count > 0)

                    {

                        Debug.WriteLine("The Connections table exists and has data.");

                    }

                    else

                    {

                        Debug.WriteLine("The Connections table does not exist or is empty.");

                    }

                }

                catch (Exception ex)

                {

                    Debug.WriteLine($"Error creating database: {ex.Message}");

                }

            }


        }


    }
}
