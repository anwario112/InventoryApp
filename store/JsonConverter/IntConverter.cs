using System;
using System.Text.Json;
using System.Text.Json.Serialization;

public class IntConverter : JsonConverter<int>
{
    public override int Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)

    {

        if (reader.TokenType == JsonTokenType.String)

        {

           

            if (int.TryParse(reader.GetString(), out int value))

            {

                return value;

            }

        }

        else if (reader.TokenType == JsonTokenType.Number)

        {

            return reader.GetInt32();

        }


        throw new JsonException("Invalid value for integer.");

    }

    public override void Write(Utf8JsonWriter writer, int value, JsonSerializerOptions options)
    {
        writer.WriteNumberValue(value);
    }
}