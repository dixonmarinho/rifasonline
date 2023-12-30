using Npgsql;
using Sorteio.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Sorteio.Data
{
    public class SqlDataContext : IDisposable
    {
        public NpgsqlConnection Connection { get; }

        private static Dictionary<string, string> connectionStringCache = new Dictionary<string, string>();
        private const string KeyConnectionString = "connection";
        public SqlDataContext()
        {
            string connectionString = "";
            if (!connectionStringCache.TryGetValue(KeyConnectionString, out connectionString))
            {
                connectionString = APICoreCommon.GetValueSetting(KeyConnectionString);

                if (!connectionStringCache.ContainsKey(KeyConnectionString))

                    connectionStringCache.Add(KeyConnectionString, connectionString);
            }

            Connection = new NpgsqlConnection(connectionString);

            Connection.Open();
        }

        public void Dispose()
        {
            if (Connection.State == ConnectionState.Open)
                Connection.Close();

            GC.SuppressFinalize(this);
        }
    }
}
