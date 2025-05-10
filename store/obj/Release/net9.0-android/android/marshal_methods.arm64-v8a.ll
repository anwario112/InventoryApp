; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [310 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [930 x i64] [
	i64 u0x0010bf7088f76c5f, ; 0: Google.Cloud.Firestore.V1 => 78
	i64 u0x004df92dbfbd34f0, ; 1: lib_NetTopologySuite.dll.so => 139
	i64 u0x006b9d7c1c7e1c42, ; 2: de/Microsoft.Data.SqlClient.resources => 1
	i64 u0x0071cf2d27b7d61e, ; 3: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 196
	i64 u0x00c57621600ce92e, ; 4: Microsoft.SqlServer.Types.dll => 138
	i64 u0x01109b0e4d99e61f, ; 5: System.ComponentModel.Annotations.dll => 218
	i64 u0x01af0bd6467d518e, ; 6: lib_ZXing.Net.MAUI.dll.so => 206
	i64 u0x020f428300334897, ; 7: Grpc.Net.Client.dll => 84
	i64 u0x02123411c4e01926, ; 8: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 191
	i64 u0x022e81ea9c46e03a, ; 9: lib_CommunityToolkit.Maui.Core.dll.so => 62
	i64 u0x02827b47e97f2378, ; 10: System.Security.Cryptography.Pkcs.dll => 164
	i64 u0x029b2c18aaa0996c, ; 11: lib-ko-Microsoft.Data.SqlClient.resources.dll.so => 6
	i64 u0x02a4c5a44384f885, ; 12: Microsoft.Extensions.Caching.Memory => 113
	i64 u0x02abedc11addc1ed, ; 13: lib_Mono.Android.Runtime.dll.so => 308
	i64 u0x032267b2a94db371, ; 14: lib_Xamarin.AndroidX.AppCompat.dll.so => 169
	i64 u0x03621c804933a890, ; 15: System.Buffers => 212
	i64 u0x0363ac97a4cb84e6, ; 16: SQLitePCLRaw.provider.e_sqlite3.dll => 152
	i64 u0x0399610510a38a38, ; 17: lib_System.Private.DataContractSerialization.dll.so => 259
	i64 u0x043032f1d071fae0, ; 18: ru/Microsoft.Maui.Controls.resources => 37
	i64 u0x044440a55165631e, ; 19: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 15
	i64 u0x046eb1581a80c6b0, ; 20: vi/Microsoft.Maui.Controls.resources => 43
	i64 u0x0470607fd33c32db, ; 21: Microsoft.IdentityModel.Abstractions.dll => 125
	i64 u0x0517ef04e06e9f76, ; 22: System.Net.Primitives => 251
	i64 u0x0531da14b48c1e10, ; 23: ja/Microsoft.SqlServer.Types.resources.dll => 51
	i64 u0x0565d18c6da3de38, ; 24: Xamarin.AndroidX.RecyclerView => 193
	i64 u0x057bf9fa9fb09f7c, ; 25: Microsoft.Data.Sqlite.dll => 103
	i64 u0x0581db89237110e9, ; 26: lib_System.Collections.dll.so => 217
	i64 u0x05989cb940b225a9, ; 27: Microsoft.Maui.dll => 134
	i64 u0x05a1c25e78e22d87, ; 28: lib_System.Runtime.CompilerServices.Unsafe.dll.so => 267
	i64 u0x05c6334bc4836f1a, ; 29: Microsoft.SqlServer.Types => 138
	i64 u0x05d8ca8ee551619f, ; 30: zh-Hant/Microsoft.Data.SqlClient.resources => 12
	i64 u0x05ef98b6a1db882c, ; 31: lib_Microsoft.Data.Sqlite.dll.so => 103
	i64 u0x06073ed944b92dc4, ; 32: lib-tr-Microsoft.Data.SqlClient.resources.dll.so => 10
	i64 u0x06076b5d2b581f08, ; 33: zh-HK/Microsoft.Maui.Controls.resources => 44
	i64 u0x06388ffe9f6c161a, ; 34: System.Xml.Linq.dll => 300
	i64 u0x0680a433c781bb3d, ; 35: Xamarin.AndroidX.Collection.Jvm => 176
	i64 u0x07c57877c7ba78ad, ; 36: ru/Microsoft.Maui.Controls.resources.dll => 37
	i64 u0x07dcdc7460a0c5e4, ; 37: System.Collections.NonGeneric => 215
	i64 u0x08015600dcbf6dc7, ; 38: it/Microsoft.Data.SqlClient.resources.dll => 4
	i64 u0x08881a0a9768df86, ; 39: lib_Azure.Core.dll.so => 58
	i64 u0x08a7c865576bbde7, ; 40: System.Reflection.Primitives => 266
	i64 u0x08d348803591587f, ; 41: lib-zh-Hant-Microsoft.SqlServer.Types.resources.dll.so => 56
	i64 u0x08f3c9788ee2153c, ; 42: Xamarin.AndroidX.DrawerLayout => 181
	i64 u0x090a04c5180cf016, ; 43: itext.styledxmlparser => 96
	i64 u0x09138715c92dba90, ; 44: lib_System.ComponentModel.Annotations.dll.so => 218
	i64 u0x0919c28b89381a0b, ; 45: lib_Microsoft.Extensions.Options.dll.so => 121
	i64 u0x092266563089ae3e, ; 46: lib_System.Collections.NonGeneric.dll.so => 215
	i64 u0x095cacaf6b6a32e4, ; 47: System.Memory.Data => 163
	i64 u0x09d144a7e214d457, ; 48: System.Security.Cryptography => 286
	i64 u0x09e2b9f743db21a8, ; 49: lib_System.Reflection.Metadata.dll.so => 265
	i64 u0x0a805f95d98f597b, ; 50: lib_Microsoft.Extensions.Caching.Abstractions.dll.so => 112
	i64 u0x0abb3e2b271edc45, ; 51: System.Threading.Channels.dll => 293
	i64 u0x0adeb6c0f5699d33, ; 52: Microsoft.Data.SqlClient.dll => 102
	i64 u0x0af14ac472d816c7, ; 53: EFCore.BulkExtensions.Sqlite.dll => 67
	i64 u0x0b3b632c3bbee20c, ; 54: sk/Microsoft.Maui.Controls.resources => 38
	i64 u0x0b6aff547b84fbe9, ; 55: Xamarin.KotlinX.Serialization.Core.Jvm => 204
	i64 u0x0be2e1f8ce4064ed, ; 56: Xamarin.AndroidX.ViewPager => 197
	i64 u0x0c279376b1ae96ae, ; 57: lib_System.CodeDom.dll.so => 154
	i64 u0x0c3ca6cc978e2aae, ; 58: pt-BR/Microsoft.Maui.Controls.resources => 34
	i64 u0x0c3d7adcdb333bf0, ; 59: Xamarin.AndroidX.Camera.Lifecycle => 173
	i64 u0x0c59ad9fbbd43abe, ; 60: Mono.Android => 309
	i64 u0x0c6924c4d04dd909, ; 61: lib_System.DirectoryServices.Protocols.dll.so => 159
	i64 u0x0c7790f60165fc06, ; 62: lib_Microsoft.Maui.Essentials.dll.so => 135
	i64 u0x0cce4bce83380b7f, ; 63: Xamarin.AndroidX.Security.SecurityCrypto => 195
	i64 u0x0d3b5ab8b2766190, ; 64: lib_Microsoft.Bcl.AsyncInterfaces.dll.so => 101
	i64 u0x0d565cb22b8879da, ; 65: lib_Grpc.Core.Api.dll.so => 83
	i64 u0x0d573c83ae0263d7, ; 66: EFCore.BulkExtensions.Oracle.dll => 65
	i64 u0x0e14e73a54dda68e, ; 67: lib_System.Net.NameResolution.dll.so => 249
	i64 u0x0f5e7abaa7cf470a, ; 68: System.Net.HttpListener => 248
	i64 u0x0fbe06392ef90569, ; 69: lib-ja-Microsoft.Data.SqlClient.resources.dll.so => 5
	i64 u0x102861e4055f511a, ; 70: Microsoft.Bcl.AsyncInterfaces.dll => 101
	i64 u0x102a31b45304b1da, ; 71: Xamarin.AndroidX.CustomView => 180
	i64 u0x108cf0e0ba098a51, ; 72: es/Microsoft.Data.SqlClient.resources => 2
	i64 u0x10f6cfcbcf801616, ; 73: System.IO.Compression.Brotli => 234
	i64 u0x114443cdcf2091f1, ; 74: System.Security.Cryptography.Primitives => 284
	i64 u0x115c94fcc3878c6a, ; 75: it/Microsoft.SqlServer.Types.resources => 50
	i64 u0x123639456fb056da, ; 76: System.Reflection.Emit.Lightweight.dll => 264
	i64 u0x124b1cd9ce23ae6f, ; 77: Google.Api.Gax.Rest => 73
	i64 u0x125b7f94acb989db, ; 78: Xamarin.AndroidX.RecyclerView.dll => 193
	i64 u0x126ee4b0de53cbfd, ; 79: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 129
	i64 u0x12f23aabd624cf79, ; 80: lib_Google.Cloud.Firestore.V1.dll.so => 78
	i64 u0x138567fa954faa55, ; 81: Xamarin.AndroidX.Browser => 171
	i64 u0x13a01de0cbc3f06c, ; 82: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 21
	i64 u0x13f1e5e209e91af4, ; 83: lib_Java.Interop.dll.so => 307
	i64 u0x13f1e880c25d96d1, ; 84: he/Microsoft.Maui.Controls.resources => 22
	i64 u0x143a1f6e62b82b56, ; 85: Microsoft.IdentityModel.Protocols.OpenIdConnect => 129
	i64 u0x143d8ea60a6a4011, ; 86: Microsoft.Extensions.DependencyInjection.Abstractions => 117
	i64 u0x1486e3d77f17a017, ; 87: lib_EFCore.BulkExtensions.PostgreSql.dll.so => 66
	i64 u0x14b0660e629937d5, ; 88: itext.pdfua => 94
	i64 u0x152a448bd1e745a7, ; 89: Microsoft.Win32.Primitives => 210
	i64 u0x159cc6c81072f00e, ; 90: lib_System.Diagnostics.EventLog.dll.so => 157
	i64 u0x15bdc156ed462f2f, ; 91: lib_System.IO.FileSystem.dll.so => 238
	i64 u0x16054fdcb6b3098b, ; 92: Microsoft.Extensions.DependencyModel.dll => 118
	i64 u0x162be8a76b00cd97, ; 93: lib-de-Microsoft.Data.SqlClient.resources.dll.so => 1
	i64 u0x16bf2a22df043a09, ; 94: System.IO.Pipes.dll => 241
	i64 u0x16ea2b318ad2d830, ; 95: System.Security.Cryptography.Algorithms => 281
	i64 u0x17125c9a85b4929f, ; 96: lib_netstandard.dll.so => 305
	i64 u0x1716866f7416792e, ; 97: lib_System.Security.AccessControl.dll.so => 279
	i64 u0x1791d47293d97a1b, ; 98: lib_Npgsql.EntityFrameworkCore.PostgreSQL.dll.so => 144
	i64 u0x17b56e25558a5d36, ; 99: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 25
	i64 u0x17f9358913beb16a, ; 100: System.Text.Encodings.Web => 290
	i64 u0x18402a709e357f3b, ; 101: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 204
	i64 u0x18a9befae51bb361, ; 102: System.Net.WebClient => 255
	i64 u0x18f0ce884e87d89a, ; 103: nb/Microsoft.Maui.Controls.resources.dll => 31
	i64 u0x19a4c090f14ebb66, ; 104: System.Security.Claims => 280
	i64 u0x19cc755c2ef2727f, ; 105: itext.bouncy-castle-adapter.dll => 98
	i64 u0x1a040febb58bf51e, ; 106: lib_Xamarin.AndroidX.Camera.View.dll.so => 174
	i64 u0x1a21ad8fb8814a23, ; 107: lib_UraniumUI.dll.so => 166
	i64 u0x1a539258f88190d6, ; 108: lib_System.Linq.Async.dll.so => 161
	i64 u0x1a6fceea64859810, ; 109: Azure.Identity => 59
	i64 u0x1a91866a319e9259, ; 110: lib_System.Collections.Concurrent.dll.so => 213
	i64 u0x1aac34d1917ba5d3, ; 111: lib_System.dll.so => 304
	i64 u0x1aad60783ffa3e5b, ; 112: lib-th-Microsoft.Maui.Controls.resources.dll.so => 40
	i64 u0x1ad25954979b4239, ; 113: de/Microsoft.SqlServer.Types.resources => 47
	i64 u0x1c753b5ff15bce1b, ; 114: Mono.Android.Runtime.dll => 308
	i64 u0x1cb6a0ededc839e2, ; 115: lib_Google.Apis.Auth.dll.so => 75
	i64 u0x1d36e5f6bd20345e, ; 116: de/Microsoft.SqlServer.Types.resources.dll => 47
	i64 u0x1d4c109ca6e27ed8, ; 117: lib_Microsoft.Maui.Controls.Compatibility.dll.so => 131
	i64 u0x1da4110562816681, ; 118: Xamarin.AndroidX.Security.SecurityCrypto.dll => 195
	i64 u0x1db6820994506bf5, ; 119: System.IO.FileSystem.AccessControl.dll => 236
	i64 u0x1dba6509cc55b56f, ; 120: lib_Google.Protobuf.dll.so => 81
	i64 u0x1dbb0c2c6a999acb, ; 121: System.Diagnostics.StackTrace => 227
	i64 u0x1e3d87657e9659bc, ; 122: Xamarin.AndroidX.Navigation.UI => 192
	i64 u0x1e71143913d56c10, ; 123: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 29
	i64 u0x1ed8fcce5e9b50a0, ; 124: Microsoft.Extensions.Options.dll => 121
	i64 u0x1f055d15d807e1b2, ; 125: System.Xml.XmlSerializer => 303
	i64 u0x1f1ed22c1085f044, ; 126: lib_System.Diagnostics.FileVersionInfo.dll.so => 225
	i64 u0x20237ea48006d7a8, ; 127: lib_System.Net.WebClient.dll.so => 255
	i64 u0x2029206e81fec6b7, ; 128: EFCore.BulkExtensions.Oracle => 65
	i64 u0x209375905fcc1bad, ; 129: lib_System.IO.Compression.Brotli.dll.so => 234
	i64 u0x20d9b03355e48538, ; 130: lib_FirebaseAdmin.dll.so => 69
	i64 u0x20e085517023eec8, ; 131: lib_Google.Api.Gax.dll.so => 71
	i64 u0x20fab3cf2dfbc8df, ; 132: lib_System.Diagnostics.Process.dll.so => 226
	i64 u0x2174319c0d835bc9, ; 133: System.Runtime => 278
	i64 u0x2199f06354c82d3b, ; 134: System.ClientModel.dll => 153
	i64 u0x21cc7e445dcd5469, ; 135: System.Reflection.Emit.ILGeneration => 263
	i64 u0x220fd4f2e7c48170, ; 136: th/Microsoft.Maui.Controls.resources => 40
	i64 u0x224538d85ed15a82, ; 137: System.IO.Pipes => 241
	i64 u0x22fe1aafc4641617, ; 138: itext.bouncy-castle-connector => 88
	i64 u0x237be844f1f812c7, ; 139: System.Threading.Thread.dll => 295
	i64 u0x23807c59646ec4f3, ; 140: lib_Microsoft.EntityFrameworkCore.dll.so => 105
	i64 u0x23b0dd507a933aa9, ; 141: Google.Api.Gax => 71
	i64 u0x23f599165f90dd7a, ; 142: lib-cs-Microsoft.Data.SqlClient.resources.dll.so => 0
	i64 u0x2407aef2bbe8fadf, ; 143: System.Console => 222
	i64 u0x240abe014b27e7d3, ; 144: Xamarin.AndroidX.Core.dll => 178
	i64 u0x247619fe4413f8bf, ; 145: System.Runtime.Serialization.Primitives.dll => 276
	i64 u0x24b95d581a70fbee, ; 146: Grpc.Auth.dll => 82
	i64 u0x24d4238047d7310f, ; 147: Google.Apis.Auth => 75
	i64 u0x252073cc3caa62c2, ; 148: fr/Microsoft.Maui.Controls.resources.dll => 21
	i64 u0x256b8d41255f01b1, ; 149: Xamarin.Google.Crypto.Tink.Android => 200
	i64 u0x25a0a7eff76ea08e, ; 150: SQLitePCLRaw.batteries_v2.dll => 149
	i64 u0x2662c629b96b0b30, ; 151: lib_Xamarin.Kotlin.StdLib.dll.so => 202
	i64 u0x268c1439f13bcc29, ; 152: lib_Microsoft.Extensions.Primitives.dll.so => 122
	i64 u0x268f1dca6d06d437, ; 153: Xamarin.AndroidX.Camera.Core => 172
	i64 u0x26966e2539bcd4cc, ; 154: zh-Hant/Microsoft.SqlServer.Types.resources.dll => 56
	i64 u0x270a44600c921861, ; 155: System.IdentityModel.Tokens.Jwt => 160
	i64 u0x273f3515de5faf0d, ; 156: id/Microsoft.Maui.Controls.resources.dll => 26
	i64 u0x2742545f9094896d, ; 157: hr/Microsoft.Maui.Controls.resources => 24
	i64 u0x27b2b16f3e9de038, ; 158: Xamarin.Google.Crypto.Tink.Android.dll => 200
	i64 u0x27b410442fad6cf1, ; 159: Java.Interop.dll => 307
	i64 u0x27d02a8c78fe0900, ; 160: QuestPDF.dll => 148
	i64 u0x2801845a2c71fbfb, ; 161: System.Net.Primitives.dll => 251
	i64 u0x28c1b67181e65f11, ; 162: lib-es-Microsoft.SqlServer.Types.resources.dll.so => 48
	i64 u0x2a128783efe70ba0, ; 163: uk/Microsoft.Maui.Controls.resources.dll => 42
	i64 u0x2a3b095612184159, ; 164: lib_System.Net.NetworkInformation.dll.so => 250
	i64 u0x2a6507a5ffabdf28, ; 165: System.Diagnostics.TraceSource.dll => 229
	i64 u0x2a8556742ffd34ef, ; 166: itext.sign => 95
	i64 u0x2ad156c8e1354139, ; 167: fi/Microsoft.Maui.Controls.resources => 20
	i64 u0x2af298f63581d886, ; 168: System.Text.RegularExpressions.dll => 292
	i64 u0x2af615542f04da50, ; 169: System.IdentityModel.Tokens.Jwt.dll => 160
	i64 u0x2afc1c4f898552ee, ; 170: lib_System.Formats.Asn1.dll.so => 233
	i64 u0x2b148910ed40fbf9, ; 171: zh-Hant/Microsoft.Maui.Controls.resources.dll => 46
	i64 u0x2b56eeab97412d7a, ; 172: itext.pdfa.dll => 93
	i64 u0x2c8bd14bb93a7d82, ; 173: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 33
	i64 u0x2cbd9262ca785540, ; 174: lib_System.Text.Encoding.CodePages.dll.so => 288
	i64 u0x2cc9e1fed6257257, ; 175: lib_System.Reflection.Emit.Lightweight.dll.so => 264
	i64 u0x2cd723e9fe623c7c, ; 176: lib_System.Private.Xml.Linq.dll.so => 261
	i64 u0x2ce66f4c8733e883, ; 177: pt-BR/Microsoft.Data.SqlClient.resources.dll => 8
	i64 u0x2d169d318a968379, ; 178: System.Threading.dll => 297
	i64 u0x2d47774b7d993f59, ; 179: sv/Microsoft.Maui.Controls.resources.dll => 39
	i64 u0x2db915caf23548d2, ; 180: System.Text.Json.dll => 291
	i64 u0x2e5a40c319acb800, ; 181: System.IO.FileSystem => 238
	i64 u0x2e6f1f226821322a, ; 182: el/Microsoft.Maui.Controls.resources.dll => 18
	i64 u0x2ece398cbf74c03b, ; 183: lib_EFCore.BulkExtensions.SqlServer.dll.so => 68
	i64 u0x2f02f94df3200fe5, ; 184: System.Diagnostics.Process => 226
	i64 u0x2f2e98e1c89b1aff, ; 185: System.Xml.ReaderWriter => 301
	i64 u0x2f40b2521deba305, ; 186: lib_Microsoft.SqlServer.Server.dll.so => 137
	i64 u0x2f5911d9ba814e4e, ; 187: System.Diagnostics.Tracing => 230
	i64 u0x2feb4d2fcda05cfd, ; 188: Microsoft.Extensions.Caching.Abstractions.dll => 112
	i64 u0x309ee9eeec09a71e, ; 189: lib_Xamarin.AndroidX.Fragment.dll.so => 182
	i64 u0x309f2bedefa9a318, ; 190: Microsoft.IdentityModel.Abstractions => 125
	i64 u0x30ef53e00b9230df, ; 191: NetTopologySuite.IO.SpatiaLite => 140
	i64 u0x31195fef5d8fb552, ; 192: _Microsoft.Android.Resource.Designer.dll => 57
	i64 u0x32243413e774362a, ; 193: Xamarin.AndroidX.CardView.dll => 175
	i64 u0x323062994a141225, ; 194: lib-zh-Hans-Microsoft.SqlServer.Types.resources.dll.so => 55
	i64 u0x3235427f8d12dae1, ; 195: lib_System.Drawing.Primitives.dll.so => 231
	i64 u0x32524ae1e229f098, ; 196: itext.svg.dll => 97
	i64 u0x329753a17a517811, ; 197: fr/Microsoft.Maui.Controls.resources => 21
	i64 u0x32aa989ff07a84ff, ; 198: lib_System.Xml.ReaderWriter.dll.so => 301
	i64 u0x33829542f112d59b, ; 199: System.Collections.Immutable => 214
	i64 u0x33a31443733849fe, ; 200: lib-es-Microsoft.Maui.Controls.resources.dll.so => 19
	i64 u0x33ec63a7e226adfb, ; 201: Google.Cloud.Location.dll => 79
	i64 u0x341abc357fbb4ebf, ; 202: lib_System.Net.Sockets.dll.so => 254
	i64 u0x348d598f4054415e, ; 203: Microsoft.SqlServer.Server => 137
	i64 u0x34b2bc8bc64a1107, ; 204: System.Diagnostics.PerformanceCounter.dll => 158
	i64 u0x34c492cef793bb77, ; 205: lib_InputKit.Maui.dll.so => 86
	i64 u0x34dfd74fe2afcf37, ; 206: Microsoft.Maui => 134
	i64 u0x34e292762d9615df, ; 207: cs/Microsoft.Maui.Controls.resources.dll => 15
	i64 u0x3508234247f48404, ; 208: Microsoft.Maui.Controls => 132
	i64 u0x353590da528c9d22, ; 209: System.ComponentModel.Annotations => 218
	i64 u0x3549870798b4cd30, ; 210: lib_Xamarin.AndroidX.ViewPager2.dll.so => 198
	i64 u0x355282fc1c909694, ; 211: Microsoft.Extensions.Configuration => 114
	i64 u0x355c649948d55d97, ; 212: lib_System.Runtime.Intrinsics.dll.so => 271
	i64 u0x36263608556d5d42, ; 213: Npgsql.dll => 143
	i64 u0x3673b042508f5b6b, ; 214: lib_System.Runtime.Extensions.dll.so => 268
	i64 u0x36b2b50fdf589ae2, ; 215: System.Reflection.Emit.Lightweight => 264
	i64 u0x36cada77dc79928b, ; 216: System.IO.MemoryMappedFiles => 239
	i64 u0x36d2129305806e75, ; 217: UraniumUI => 166
	i64 u0x37410855534260db, ; 218: fr/Microsoft.SqlServer.Types.resources.dll => 49
	i64 u0x374ef46b06791af6, ; 219: System.Reflection.Primitives.dll => 266
	i64 u0x379e6c338e5508ad, ; 220: lib_Google.Api.Gax.Grpc.dll.so => 72
	i64 u0x380134e03b1e160a, ; 221: System.Collections.Immutable.dll => 214
	i64 u0x38049b5c59b39324, ; 222: System.Runtime.CompilerServices.Unsafe => 267
	i64 u0x382453cb85fe3f82, ; 223: lib_EFCore.BulkExtensions.Sqlite.dll.so => 67
	i64 u0x385c17636bb6fe6e, ; 224: Xamarin.AndroidX.CustomView.dll => 180
	i64 u0x38869c811d74050e, ; 225: System.Net.NameResolution.dll => 249
	i64 u0x38e93ec1c057cdf6, ; 226: Microsoft.IdentityModel.Protocols => 128
	i64 u0x39251dccb84bdcaa, ; 227: lib_System.Configuration.ConfigurationManager.dll.so => 155
	i64 u0x393c226616977fdb, ; 228: lib_Xamarin.AndroidX.ViewPager.dll.so => 197
	i64 u0x395e37c3334cf82a, ; 229: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 14
	i64 u0x39aa39fda111d9d3, ; 230: Newtonsoft.Json => 142
	i64 u0x39d48361041cb258, ; 231: store.dll => 208
	i64 u0x3a9ae914a83b6050, ; 232: itext.barcodes.dll => 87
	i64 u0x3ab5859054645f72, ; 233: System.Security.Cryptography.Primitives.dll => 284
	i64 u0x3b860f9932505633, ; 234: lib_System.Text.Encoding.Extensions.dll.so => 289
	i64 u0x3bea9ebe8c027c01, ; 235: lib_Microsoft.IdentityModel.Tokens.dll.so => 130
	i64 u0x3c3aafb6b3a00bf6, ; 236: lib_System.Security.Cryptography.X509Certificates.dll.so => 285
	i64 u0x3c51334447dec9e7, ; 237: Google.LongRunning => 80
	i64 u0x3c5f19e4acdcebd8, ; 238: lib_Microsoft.Data.SqlClient.dll.so => 102
	i64 u0x3c7c495f58ac5ee9, ; 239: Xamarin.Kotlin.StdLib => 202
	i64 u0x3cd9d281d402eb9b, ; 240: Xamarin.AndroidX.Browser.dll => 171
	i64 u0x3ced6a4f3010aa96, ; 241: ZXing.Net.MAUI.Controls => 207
	i64 u0x3d196e782ed8c01a, ; 242: System.Data.SqlClient => 156
	i64 u0x3d1c50cc001a991e, ; 243: Xamarin.Google.Guava.ListenableFuture.dll => 201
	i64 u0x3d2b1913edfc08d7, ; 244: lib_System.Threading.ThreadPool.dll.so => 296
	i64 u0x3d46f0b995082740, ; 245: System.Xml.Linq => 300
	i64 u0x3d9c2a242b040a50, ; 246: lib_Xamarin.AndroidX.Core.dll.so => 178
	i64 u0x3da7781d6333a8fe, ; 247: SQLitePCLRaw.batteries_v2 => 149
	i64 u0x3daa14724d8f58e8, ; 248: Google.Protobuf.dll => 81
	i64 u0x3e027e6e728d7f1c, ; 249: Google.LongRunning.dll => 80
	i64 u0x3e0b360b2840f096, ; 250: it/Microsoft.Data.SqlClient.resources => 4
	i64 u0x3f3c8f45ab6f28c7, ; 251: Microsoft.Identity.Client.Extensions.Msal.dll => 124
	i64 u0x3f510adf788828dd, ; 252: System.Threading.Tasks.Extensions => 294
	i64 u0x400eb4a58d8d746b, ; 253: lib_QuestPDF.dll.so => 148
	i64 u0x407a10bb4bf95829, ; 254: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 189
	i64 u0x407a8d1779c33f16, ; 255: System.Diagnostics.PerformanceCounter => 158
	i64 u0x407ac43dee26bd5a, ; 256: lib_Azure.Identity.dll.so => 59
	i64 u0x4104d92598b18888, ; 257: NetTopologySuite => 139
	i64 u0x41406d6f37320d99, ; 258: Google.Api.Gax.Grpc.dll => 72
	i64 u0x415e36f6b13ff6f3, ; 259: System.Configuration.ConfigurationManager.dll => 155
	i64 u0x41cab042be111c34, ; 260: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 170
	i64 u0x4202b91ac01ad789, ; 261: itext.barcodes => 87
	i64 u0x42418aba44539ffd, ; 262: Google.Cloud.Firestore => 77
	i64 u0x4266c67fd9a4ee79, ; 263: Google.Api.CommonProtos => 70
	i64 u0x42d3cd7add035099, ; 264: System.Management.dll => 162
	i64 u0x43375950ec7c1b6a, ; 265: netstandard.dll => 305
	i64 u0x434c4e1d9284cdae, ; 266: Mono.Android.dll => 309
	i64 u0x4394150249e83099, ; 267: lib_store.dll.so => 208
	i64 u0x43950f84de7cc79a, ; 268: pl/Microsoft.Maui.Controls.resources.dll => 33
	i64 u0x4396b4cdb6b3bafc, ; 269: lib-ru-Microsoft.SqlServer.Types.resources.dll.so => 54
	i64 u0x448bd33429269b19, ; 270: Microsoft.CSharp => 209
	i64 u0x4499fa3c8e494654, ; 271: lib_System.Runtime.Serialization.Primitives.dll.so => 276
	i64 u0x4515080865a951a5, ; 272: Xamarin.Kotlin.StdLib.dll => 202
	i64 u0x453c1277f85cf368, ; 273: lib_Microsoft.EntityFrameworkCore.Abstractions.dll.so => 106
	i64 u0x458d2df79ac57c1d, ; 274: lib_System.IdentityModel.Tokens.Jwt.dll.so => 160
	i64 u0x45b31d67ff6f2b8a, ; 275: lib_Google.Apis.dll.so => 74
	i64 u0x45c40276a42e283e, ; 276: System.Diagnostics.TraceSource => 229
	i64 u0x45d443f2a29adc37, ; 277: System.AppContext.dll => 211
	i64 u0x45fcc9fd66f25095, ; 278: Microsoft.Extensions.DependencyModel => 118
	i64 u0x4648b079f360842e, ; 279: itext.bouncy-castle-adapter => 98
	i64 u0x46a4213bc97fe5ae, ; 280: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 37
	i64 u0x47358bd471172e1d, ; 281: lib_System.Xml.Linq.dll.so => 300
	i64 u0x4747e19ad6a1d4bb, ; 282: Grpc.Net.Common => 85
	i64 u0x4787a936949fcac2, ; 283: System.Memory.Data.dll => 163
	i64 u0x47daf4e1afbada10, ; 284: pt/Microsoft.Maui.Controls.resources => 35
	i64 u0x480c0a47dd42dd81, ; 285: lib_System.IO.MemoryMappedFiles.dll.so => 239
	i64 u0x49e952f19a4e2022, ; 286: System.ObjectModel => 258
	i64 u0x4a5667b2462a664b, ; 287: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 192
	i64 u0x4b07a0ed0ab33ff4, ; 288: System.Runtime.Extensions.dll => 268
	i64 u0x4b576d47ac054f3c, ; 289: System.IO.FileSystem.AccessControl => 236
	i64 u0x4b7b6532ded934b7, ; 290: System.Text.Json => 291
	i64 u0x4b8f8ea3c2df6bb0, ; 291: System.ClientModel => 153
	i64 u0x4c7755cf07ad2d5f, ; 292: System.Net.Http.Json.dll => 246
	i64 u0x4ca014ceac582c86, ; 293: Microsoft.EntityFrameworkCore.Relational.dll => 107
	i64 u0x4cc5f15266470798, ; 294: lib_Xamarin.AndroidX.Loader.dll.so => 188
	i64 u0x4cf6f67dc77aacd2, ; 295: System.Net.NetworkInformation.dll => 250
	i64 u0x4d3711d4edd16f99, ; 296: Google.Api.Gax.Rest.dll => 73
	i64 u0x4d479f968a05e504, ; 297: System.Linq.Expressions.dll => 242
	i64 u0x4d55a010ffc4faff, ; 298: System.Private.Xml => 262
	i64 u0x4d6001db23f8cd87, ; 299: lib_System.ClientModel.dll.so => 153
	i64 u0x4d91e5c949c8f5e5, ; 300: InputKit.Maui.dll => 86
	i64 u0x4d95fccc1f67c7ca, ; 301: System.Runtime.Loader.dll => 272
	i64 u0x4da4a8f0f6a70fdc, ; 302: Microsoft.Maui.Controls.Compatibility.dll => 131
	i64 u0x4dcf44c3c9b076a2, ; 303: it/Microsoft.Maui.Controls.resources.dll => 27
	i64 u0x4dd9247f1d2c3235, ; 304: Xamarin.AndroidX.Loader.dll => 188
	i64 u0x4e32f00cb0937401, ; 305: Mono.Android.Runtime => 308
	i64 u0x4e5eea4668ac2b18, ; 306: System.Text.Encoding.CodePages => 288
	i64 u0x4e982534d67b56ba, ; 307: lib_itext.io.dll.so => 90
	i64 u0x4ebd0c4b82c5eefc, ; 308: lib_System.Threading.Channels.dll.so => 293
	i64 u0x4f21ee6ef9eb527e, ; 309: ca/Microsoft.Maui.Controls.resources => 14
	i64 u0x4f27ca9d6e02176c, ; 310: cs/Microsoft.Data.SqlClient.resources => 0
	i64 u0x4f3ba6ee468f1365, ; 311: es/Microsoft.SqlServer.Types.resources.dll => 48
	i64 u0x4fbc57e20df1874a, ; 312: itext.io.dll => 90
	i64 u0x4fd5f3ee53d0a4f0, ; 313: SQLitePCLRaw.lib.e_sqlite3.android => 151
	i64 u0x4ffd65baff757598, ; 314: Microsoft.IdentityModel.Tokens => 130
	i64 u0x50320f2a19424f3f, ; 315: lib-it-Microsoft.Data.SqlClient.resources.dll.so => 4
	i64 u0x5037f0be3c28c7a3, ; 316: lib_Microsoft.Maui.Controls.dll.so => 132
	i64 u0x505aa0ca2d672b22, ; 317: Microsoft.EntityFrameworkCore.SqlServer.HierarchyId => 111
	i64 u0x508c1fa6b57728d9, ; 318: Grpc.Net.Common.dll => 85
	i64 u0x50cfaa297b1f7ede, ; 319: FirebaseAdmin.dll => 69
	i64 u0x5112ed116d87baf8, ; 320: CommunityToolkit.Mvvm => 63
	i64 u0x512c33621dd468cb, ; 321: lib_itext.kernel.dll.so => 91
	i64 u0x5131bbe80989093f, ; 322: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 186
	i64 u0x5146d4e23aed3198, ; 323: ja/Microsoft.Data.SqlClient.resources => 5
	i64 u0x51bb8a2afe774e32, ; 324: System.Drawing => 232
	i64 u0x526ce79eb8e90527, ; 325: lib_System.Net.Primitives.dll.so => 251
	i64 u0x5277169428c6ebf6, ; 326: lib_Grpc.Net.Common.dll.so => 85
	i64 u0x52829f00b4467c38, ; 327: lib_System.Data.Common.dll.so => 223
	i64 u0x5290402954d7bce0, ; 328: zh-Hans/Microsoft.Data.SqlClient.resources => 11
	i64 u0x529e5a460e733af4, ; 329: lib_itext.sign.dll.so => 95
	i64 u0x529ffe06f39ab8db, ; 330: Xamarin.AndroidX.Core => 178
	i64 u0x52ff996554dbf352, ; 331: Microsoft.Maui.Graphics => 136
	i64 u0x53128e94caa50e17, ; 332: Oracle.ManagedDataAccess => 146
	i64 u0x535f7e40e8fef8af, ; 333: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 38
	i64 u0x53a96d5c86c9e194, ; 334: System.Net.NetworkInformation => 250
	i64 u0x53be1038a61e8d44, ; 335: System.Runtime.InteropServices.RuntimeInformation.dll => 269
	i64 u0x53c3014b9437e684, ; 336: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 44
	i64 u0x53d666fa678b6cea, ; 337: Microsoft.DotNet.PlatformAbstractions => 104
	i64 u0x5435e6f049e9bc37, ; 338: System.Security.Claims.dll => 280
	i64 u0x54795225dd1587af, ; 339: lib_System.Runtime.dll.so => 278
	i64 u0x547a34f14e5f6210, ; 340: Xamarin.AndroidX.Lifecycle.Common.dll => 183
	i64 u0x54b42cc2b8e65a84, ; 341: Google.Apis.Core.dll => 76
	i64 u0x556e8b63b660ab8b, ; 342: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 184
	i64 u0x5588627c9a108ec9, ; 343: System.Collections.Specialized => 216
	i64 u0x56442b99bc64bb47, ; 344: System.Runtime.Serialization.Xml.dll => 277
	i64 u0x571c5cfbec5ae8e2, ; 345: System.Private.Uri => 260
	i64 u0x578cd35c91d7b347, ; 346: lib_SQLitePCLRaw.core.dll.so => 150
	i64 u0x579a06fed6eec900, ; 347: System.Private.CoreLib.dll => 306
	i64 u0x57c542c14049b66d, ; 348: System.Diagnostics.DiagnosticSource => 224
	i64 u0x58601b2dda4a27b9, ; 349: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 28
	i64 u0x58688d9af496b168, ; 350: Microsoft.Extensions.DependencyInjection.dll => 116
	i64 u0x595a356d23e8da9a, ; 351: lib_Microsoft.CSharp.dll.so => 209
	i64 u0x59a935a032dbc08c, ; 352: lib_Grpc.Auth.dll.so => 82
	i64 u0x5a70033ca9d003cb, ; 353: lib_System.Memory.Data.dll.so => 163
	i64 u0x5a89a886ae30258d, ; 354: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 177
	i64 u0x5a8f6699f4a1caa9, ; 355: lib_System.Threading.dll.so => 297
	i64 u0x5ae9cd33b15841bf, ; 356: System.ComponentModel => 221
	i64 u0x5b54391bdc6fcfe6, ; 357: System.Private.DataContractSerialization => 259
	i64 u0x5b5f0e240a06a2a2, ; 358: da/Microsoft.Maui.Controls.resources.dll => 16
	i64 u0x5bf46332cc09e9b2, ; 359: lib_System.Data.SqlClient.dll.so => 156
	i64 u0x5c393624b8176517, ; 360: lib_Microsoft.Extensions.Logging.dll.so => 119
	i64 u0x5c53c29f5073b0c9, ; 361: System.Diagnostics.FileVersionInfo => 225
	i64 u0x5ce309995937d5a0, ; 362: pt-BR/Microsoft.SqlServer.Types.resources.dll => 53
	i64 u0x5d0a4a29b02d9d3c, ; 363: System.Net.WebHeaderCollection.dll => 256
	i64 u0x5d1b514fc45c92d4, ; 364: ZXing.Net.MAUI => 206
	i64 u0x5d33da2f84c1de97, ; 365: lib-pt-BR-Microsoft.Data.SqlClient.resources.dll.so => 8
	i64 u0x5d7960d446a1890e, ; 366: lib-pl-Microsoft.Data.SqlClient.resources.dll.so => 7
	i64 u0x5db0cbbd1028510e, ; 367: lib_System.Runtime.InteropServices.dll.so => 270
	i64 u0x5db30905d3e5013b, ; 368: Xamarin.AndroidX.Collection.Jvm.dll => 176
	i64 u0x5e467bc8f09ad026, ; 369: System.Collections.Specialized.dll => 216
	i64 u0x5ea92fdb19ec8c4c, ; 370: System.Text.Encodings.Web.dll => 290
	i64 u0x5eb8046dd40e9ac3, ; 371: System.ComponentModel.Primitives => 219
	i64 u0x5ec272d219c9aba4, ; 372: System.Security.Cryptography.Csp.dll => 282
	i64 u0x5eee1376d94c7f5e, ; 373: System.Net.HttpListener.dll => 248
	i64 u0x5f0980ab8131b542, ; 374: EFCore.BulkExtensions.Sqlite => 67
	i64 u0x5f36ccf5c6a57e24, ; 375: System.Xml.ReaderWriter.dll => 301
	i64 u0x5f4294b9b63cb842, ; 376: System.Data.Common => 223
	i64 u0x5f5be00b819666f1, ; 377: ru/Microsoft.SqlServer.Types.resources => 54
	i64 u0x5f7399e166075632, ; 378: lib_SQLitePCLRaw.lib.e_sqlite3.android.dll.so => 151
	i64 u0x5f9a2d823f664957, ; 379: lib-el-Microsoft.Maui.Controls.resources.dll.so => 18
	i64 u0x5fac98e0b37a5b9d, ; 380: System.Runtime.CompilerServices.Unsafe.dll => 267
	i64 u0x609f4b7b63d802d4, ; 381: lib_Microsoft.Extensions.DependencyInjection.dll.so => 116
	i64 u0x60cd4e33d7e60134, ; 382: Xamarin.KotlinX.Coroutines.Core.Jvm => 203
	i64 u0x60f62d786afcf130, ; 383: System.Memory => 245
	i64 u0x61be8d1299194243, ; 384: Microsoft.Maui.Controls.Xaml => 133
	i64 u0x61d2cba29557038f, ; 385: de/Microsoft.Maui.Controls.resources => 17
	i64 u0x61d88f399afb2f45, ; 386: lib_System.Runtime.Loader.dll.so => 272
	i64 u0x6219beeff33faa04, ; 387: cs/Microsoft.Data.SqlClient.resources.dll => 0
	i64 u0x622eef6f9e59068d, ; 388: System.Private.CoreLib => 306
	i64 u0x625def565caafc1c, ; 389: tr/Microsoft.Data.SqlClient.resources.dll => 10
	i64 u0x637320c71840c561, ; 390: lib_itext.pdfa.dll.so => 93
	i64 u0x63f1f6883c1e23c2, ; 391: lib_System.Collections.Immutable.dll.so => 214
	i64 u0x6400f68068c1e9f1, ; 392: Xamarin.Google.Android.Material.dll => 199
	i64 u0x640e3b14dbd325c2, ; 393: System.Security.Cryptography.Algorithms.dll => 281
	i64 u0x641bebf7cee18d1c, ; 394: Microsoft.EntityFrameworkCore.SqlServer.Abstractions.dll => 110
	i64 u0x6533c154f14eefe0, ; 395: lib_Google.Api.Gax.Rest.dll.so => 73
	i64 u0x658f524e4aba7dad, ; 396: CommunityToolkit.Maui.dll => 61
	i64 u0x65ecac39144dd3cc, ; 397: Microsoft.Maui.Controls.dll => 132
	i64 u0x65ece51227bfa724, ; 398: lib_System.Runtime.Numerics.dll.so => 273
	i64 u0x6692e924eade1b29, ; 399: lib_System.Console.dll.so => 222
	i64 u0x66a4e5c6a3fb0bae, ; 400: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 186
	i64 u0x66d13304ce1a3efa, ; 401: Xamarin.AndroidX.CursorAdapter => 179
	i64 u0x677569b965946273, ; 402: ko/Microsoft.SqlServer.Types.resources.dll => 52
	i64 u0x67c0d6eb5a84aa5a, ; 403: lib_System.Diagnostics.PerformanceCounter.dll.so => 158
	i64 u0x68558ec653afa616, ; 404: lib-da-Microsoft.Maui.Controls.resources.dll.so => 16
	i64 u0x6872ec7a2e36b1ac, ; 405: System.Drawing.Primitives.dll => 231
	i64 u0x68fbbbe2eb455198, ; 406: System.Formats.Asn1 => 233
	i64 u0x69063fc0ba8e6bdd, ; 407: he/Microsoft.Maui.Controls.resources.dll => 22
	i64 u0x699dffb2427a2d71, ; 408: SQLitePCLRaw.lib.e_sqlite3.android.dll => 151
	i64 u0x6a4d7577b2317255, ; 409: System.Runtime.InteropServices.dll => 270
	i64 u0x6ace3b74b15ee4a4, ; 410: nb/Microsoft.Maui.Controls.resources => 31
	i64 u0x6bc822f45373a1d6, ; 411: Google.Apis.dll => 74
	i64 u0x6c7d5f4d06aadeaa, ; 412: EFCore.BulkExtensions.SqlServer.dll => 68
	i64 u0x6cd97f370311a542, ; 413: Microsoft.EntityFrameworkCore.SqlServer => 109
	i64 u0x6d0a12b2adba20d8, ; 414: System.Security.Cryptography.ProtectedData.dll => 165
	i64 u0x6d12bfaa99c72b1f, ; 415: lib_Microsoft.Maui.Graphics.dll.so => 136
	i64 u0x6d3b7628f8253e93, ; 416: pl/Microsoft.Data.SqlClient.resources => 7
	i64 u0x6d79993361e10ef2, ; 417: Microsoft.Extensions.Primitives => 122
	i64 u0x6d86d56b84c8eb71, ; 418: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 179
	i64 u0x6d9bea6b3e895cf7, ; 419: Microsoft.Extensions.Primitives.dll => 122
	i64 u0x6e25a02c3833319a, ; 420: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 190
	i64 u0x6fd2265da78b93a4, ; 421: lib_Microsoft.Maui.dll.so => 134
	i64 u0x6fdfc7de82c33008, ; 422: cs/Microsoft.Maui.Controls.resources => 15
	i64 u0x6ffc4967cc47ba57, ; 423: System.IO.FileSystem.Watcher.dll => 237
	i64 u0x701cd46a1c25a5fe, ; 424: System.IO.FileSystem.dll => 238
	i64 u0x706442eb8d0ca9f8, ; 425: Plainer.Maui.dll => 147
	i64 u0x70e99f48c05cb921, ; 426: tr/Microsoft.Maui.Controls.resources.dll => 41
	i64 u0x70fd3deda22442d2, ; 427: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 31
	i64 u0x71a495ea3761dde8, ; 428: lib-it-Microsoft.Maui.Controls.resources.dll.so => 27
	i64 u0x71ad672adbe48f35, ; 429: System.ComponentModel.Primitives.dll => 219
	i64 u0x71bc142d620e986a, ; 430: lib_System.Security.Cryptography.Pkcs.dll.so => 164
	i64 u0x725f5a9e82a45c81, ; 431: System.Security.Cryptography.Encoding => 283
	i64 u0x72b1fb4109e08d7b, ; 432: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 24
	i64 u0x73a22de3db7e3506, ; 433: lib-ko-Microsoft.SqlServer.Types.resources.dll.so => 52
	i64 u0x73e4ce94e2eb6ffc, ; 434: lib_System.Memory.dll.so => 245
	i64 u0x73f2645914262879, ; 435: lib_Microsoft.EntityFrameworkCore.Sqlite.dll.so => 108
	i64 u0x74770d0c84d62bee, ; 436: EFCore.BulkExtensions.SqlServer => 68
	i64 u0x74d88540363e57e3, ; 437: MedallionTopologicalSort => 100
	i64 u0x755a91767330b3d4, ; 438: lib_Microsoft.Extensions.Configuration.dll.so => 114
	i64 u0x76012e7334db86e5, ; 439: lib_Xamarin.AndroidX.SavedState.dll.so => 194
	i64 u0x76ca07b878f44da0, ; 440: System.Runtime.Numerics.dll => 273
	i64 u0x770e0cc2309fe21d, ; 441: lib-pt-BR-Microsoft.SqlServer.Types.resources.dll.so => 53
	i64 u0x780bc73597a503a9, ; 442: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 30
	i64 u0x783606d1e53e7a1a, ; 443: th/Microsoft.Maui.Controls.resources.dll => 40
	i64 u0x78a45e51311409b6, ; 444: Xamarin.AndroidX.Fragment.dll => 182
	i64 u0x79eb916f2d11e1f0, ; 445: zh-Hans/Microsoft.Data.SqlClient.resources.dll => 11
	i64 u0x7a9a57d43b0845fa, ; 446: System.AppContext => 211
	i64 u0x7adb8da2ac89b647, ; 447: fi/Microsoft.Maui.Controls.resources.dll => 20
	i64 u0x7b150145c0a9058c, ; 448: Microsoft.Data.Sqlite => 103
	i64 u0x7b4927e421291c41, ; 449: Microsoft.IdentityModel.JsonWebTokens.dll => 126
	i64 u0x7bef86a4335c4870, ; 450: System.ComponentModel.TypeConverter => 220
	i64 u0x7c0820144cd34d6a, ; 451: sk/Microsoft.Maui.Controls.resources.dll => 38
	i64 u0x7c2a0bd1e0f988fc, ; 452: lib-de-Microsoft.Maui.Controls.resources.dll.so => 17
	i64 u0x7c41d387501568ba, ; 453: System.Net.WebClient.dll => 255
	i64 u0x7cc637f941f716d0, ; 454: CommunityToolkit.Maui.Core => 62
	i64 u0x7d649b75d580bb42, ; 455: ms/Microsoft.Maui.Controls.resources.dll => 30
	i64 u0x7d8ee2bdc8e3aad1, ; 456: System.Numerics.Vectors => 257
	i64 u0x7dc2a070ce60a1e2, ; 457: itext.bouncy-castle-connector.dll => 88
	i64 u0x7dfc3d6d9d8d7b70, ; 458: System.Collections => 217
	i64 u0x7e034293328f139a, ; 459: EFCore.BulkExtensions.PostgreSql => 66
	i64 u0x7e1f8f575a3599cb, ; 460: BouncyCastle.Cryptography.dll => 60
	i64 u0x7e2e564fa2f76c65, ; 461: lib_System.Diagnostics.Tracing.dll.so => 230
	i64 u0x7e302e110e1e1346, ; 462: lib_System.Security.Claims.dll.so => 280
	i64 u0x7e946809d6008ef2, ; 463: lib_System.ObjectModel.dll.so => 258
	i64 u0x7ecc13347c8fd849, ; 464: lib_System.ComponentModel.dll.so => 221
	i64 u0x7f00ddd9b9ca5a13, ; 465: Xamarin.AndroidX.ViewPager.dll => 197
	i64 u0x7f9351cd44b1273f, ; 466: Microsoft.Extensions.Configuration.Abstractions => 115
	i64 u0x7fae0ef4dc4770fe, ; 467: Microsoft.Identity.Client => 123
	i64 u0x7fbd557c99b3ce6f, ; 468: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 185
	i64 u0x80da183a87731838, ; 469: System.Reflection.Metadata => 265
	i64 u0x80fa55b6d1b0be99, ; 470: SQLitePCLRaw.provider.e_sqlite3 => 152
	i64 u0x812c069d5cdecc17, ; 471: System.dll => 304
	i64 u0x8145faf772692484, ; 472: Google.Cloud.Firestore.V1.dll => 78
	i64 u0x81ab745f6c0f5ce6, ; 473: zh-Hant/Microsoft.Maui.Controls.resources => 46
	i64 u0x8277f2be6b5ce05f, ; 474: Xamarin.AndroidX.AppCompat => 169
	i64 u0x828f06563b30bc50, ; 475: lib_Xamarin.AndroidX.CardView.dll.so => 175
	i64 u0x82df8f5532a10c59, ; 476: lib_System.Drawing.dll.so => 232
	i64 u0x82f6403342e12049, ; 477: uk/Microsoft.Maui.Controls.resources => 42
	i64 u0x833edc738697d898, ; 478: itext.layout.dll => 92
	i64 u0x8350268f9d350eec, ; 479: itext.commons => 99
	i64 u0x83a7afd2c49adc86, ; 480: lib_Microsoft.IdentityModel.Abstractions.dll.so => 125
	i64 u0x83c14ba66c8e2b8c, ; 481: zh-Hans/Microsoft.Maui.Controls.resources => 45
	i64 u0x844ac8f64fd78edc, ; 482: Xamarin.AndroidX.Camera.View.dll => 174
	i64 u0x84ae73148a4557d2, ; 483: lib_System.IO.Pipes.dll.so => 241
	i64 u0x84b01102c12a9232, ; 484: System.Runtime.Serialization.Json.dll => 275
	i64 u0x84bc82b42469a609, ; 485: Oracle.EntityFrameworkCore => 145
	i64 u0x84cd5cdec0f54bcc, ; 486: lib_Microsoft.EntityFrameworkCore.Relational.dll.so => 107
	i64 u0x8528b82bdbc15371, ; 487: ko/Microsoft.Data.SqlClient.resources => 6
	i64 u0x8533cf0079a66e49, ; 488: lib_Oracle.EntityFrameworkCore.dll.so => 145
	i64 u0x86a909228dc7657b, ; 489: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 46
	i64 u0x86b3e00c36b84509, ; 490: Microsoft.Extensions.Configuration.dll => 114
	i64 u0x86b62cb077ec4fd7, ; 491: System.Runtime.Serialization.Xml => 277
	i64 u0x87c4b8a492b176ad, ; 492: Microsoft.EntityFrameworkCore.Abstractions => 106
	i64 u0x87c69b87d9283884, ; 493: lib_System.Threading.Thread.dll.so => 295
	i64 u0x87f6569b25707834, ; 494: System.IO.Compression.Brotli.dll => 234
	i64 u0x87fef727071b7fe5, ; 495: Grpc.Net.Client => 84
	i64 u0x8842b3a5d2d3fb36, ; 496: Microsoft.Maui.Essentials => 135
	i64 u0x88bda98e0cffb7a9, ; 497: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 203
	i64 u0x8930322c7bd8f768, ; 498: netstandard => 305
	i64 u0x894dbdd1ac38f4e1, ; 499: Plainer.Maui => 147
	i64 u0x897a606c9e39c75f, ; 500: lib_System.ComponentModel.Primitives.dll.so => 219
	i64 u0x89c5188089ec2cd5, ; 501: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 269
	i64 u0x8a399a706fcbce4b, ; 502: Microsoft.Extensions.Caching.Abstractions => 112
	i64 u0x8a90bab2026e5b88, ; 503: Google.Cloud.Firestore.dll => 77
	i64 u0x8ad229ea26432ee2, ; 504: Xamarin.AndroidX.Loader => 188
	i64 u0x8aed8bcfab24aa6d, ; 505: itext.svg => 97
	i64 u0x8b4ff5d0fdd5faa1, ; 506: lib_System.Diagnostics.DiagnosticSource.dll.so => 224
	i64 u0x8b541d476eb3774c, ; 507: System.Security.Principal.Windows => 287
	i64 u0x8b8d01333a96d0b5, ; 508: System.Diagnostics.Process.dll => 226
	i64 u0x8b9ceca7acae3451, ; 509: lib-he-Microsoft.Maui.Controls.resources.dll.so => 22
	i64 u0x8c156fe7f184f137, ; 510: tr/Microsoft.Data.SqlClient.resources => 10
	i64 u0x8c53ae18581b14f0, ; 511: Azure.Core => 58
	i64 u0x8cb6d28731d97279, ; 512: System.DirectoryServices.Protocols => 159
	i64 u0x8cdfdb4ce85fb925, ; 513: lib_System.Security.Principal.Windows.dll.so => 287
	i64 u0x8cf51f1eb9e90658, ; 514: lib_Microsoft.EntityFrameworkCore.SqlServer.dll.so => 109
	i64 u0x8d0f420977c2c1c7, ; 515: Xamarin.AndroidX.CursorAdapter.dll => 179
	i64 u0x8d2551476f2e2ef7, ; 516: lib_UraniumUI.Material.dll.so => 167
	i64 u0x8d52a25632e81824, ; 517: Microsoft.EntityFrameworkCore.Sqlite.dll => 108
	i64 u0x8d7b8ab4b3310ead, ; 518: System.Threading => 297
	i64 u0x8da188285aadfe8e, ; 519: System.Collections.Concurrent => 213
	i64 u0x8dfc1cfbf8858f95, ; 520: Grpc.Core.Api.dll => 83
	i64 u0x8e7b0d6c6f6404e3, ; 521: fr/Microsoft.SqlServer.Types.resources => 49
	i64 u0x8e937db395a74375, ; 522: lib_Microsoft.Identity.Client.dll.so => 123
	i64 u0x8e9b88b113d62c7d, ; 523: zh-Hant/Microsoft.SqlServer.Types.resources => 56
	i64 u0x8ebba9258a550f92, ; 524: lib_Plainer.Maui.dll.so => 147
	i64 u0x8ec6e06a61c1baeb, ; 525: lib_Newtonsoft.Json.dll.so => 142
	i64 u0x8ed3cdd722b4d782, ; 526: System.Diagnostics.EventLog => 157
	i64 u0x8ed807bfe9858dfc, ; 527: Xamarin.AndroidX.Navigation.Common => 189
	i64 u0x8ee08b8194a30f48, ; 528: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 23
	i64 u0x8ef7601039857a44, ; 529: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 36
	i64 u0x8ef9414937d93a0a, ; 530: SQLitePCLRaw.core.dll => 150
	i64 u0x8f32c6f611f6ffab, ; 531: pt/Microsoft.Maui.Controls.resources.dll => 35
	i64 u0x8f8829d21c8985a4, ; 532: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 34
	i64 u0x8fd27d934d7b3a55, ; 533: SQLitePCLRaw.core => 150
	i64 u0x90263f8448b8f572, ; 534: lib_System.Diagnostics.TraceSource.dll.so => 229
	i64 u0x9027f725f74f5c08, ; 535: lib_NetTopologySuite.IO.SpatiaLite.dll.so => 140
	i64 u0x902d31dbd7d7d78e, ; 536: InputKit.Maui => 86
	i64 u0x903101b46fb73a04, ; 537: _Microsoft.Android.Resource.Designer => 57
	i64 u0x90393bd4865292f3, ; 538: lib_System.IO.Compression.dll.so => 235
	i64 u0x905e2b8e7ae91ae6, ; 539: System.Threading.Tasks.Extensions.dll => 294
	i64 u0x90634f86c5ebe2b5, ; 540: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 186
	i64 u0x907b636704ad79ef, ; 541: lib_Microsoft.Maui.Controls.Xaml.dll.so => 133
	i64 u0x91418dc638b29e68, ; 542: lib_Xamarin.AndroidX.CustomView.dll.so => 180
	i64 u0x9157bd523cd7ed36, ; 543: lib_System.Text.Json.dll.so => 291
	i64 u0x91a74f07b30d37e2, ; 544: System.Linq.dll => 244
	i64 u0x91fa41a87223399f, ; 545: ca/Microsoft.Maui.Controls.resources.dll => 14
	i64 u0x93489853b6098685, ; 546: es/Microsoft.Data.SqlClient.resources.dll => 2
	i64 u0x9388aad9b7ae40ce, ; 547: lib_Xamarin.AndroidX.Lifecycle.Common.dll.so => 183
	i64 u0x93cfa73ab28d6e35, ; 548: ms/Microsoft.Maui.Controls.resources => 30
	i64 u0x944077d8ca3c6580, ; 549: System.IO.Compression.dll => 235
	i64 u0x948d746a7702861f, ; 550: Microsoft.IdentityModel.Logging.dll => 127
	i64 u0x9502fd818eed2359, ; 551: lib_Microsoft.IdentityModel.Protocols.OpenIdConnect.dll.so => 129
	i64 u0x9564283c37ed59a9, ; 552: lib_Microsoft.IdentityModel.Logging.dll.so => 127
	i64 u0x95d757769563d0d3, ; 553: Xamarin.AndroidX.Camera.Lifecycle.dll => 173
	i64 u0x965d480cfb8de46d, ; 554: pl/Microsoft.Data.SqlClient.resources.dll => 7
	i64 u0x967fc325e09bfa8c, ; 555: es/Microsoft.Maui.Controls.resources => 19
	i64 u0x96e49b31fe33d427, ; 556: Microsoft.Identity.Client.Extensions.Msal => 124
	i64 u0x9729c8c4c069c478, ; 557: Google.Apis.Core => 76
	i64 u0x9732d8dbddea3d9a, ; 558: id/Microsoft.Maui.Controls.resources => 26
	i64 u0x978be80e5210d31b, ; 559: Microsoft.Maui.Graphics.dll => 136
	i64 u0x97b8c771ea3e4220, ; 560: System.ComponentModel.dll => 221
	i64 u0x97e144c9d3c6976e, ; 561: System.Collections.Concurrent.dll => 213
	i64 u0x99052c1297204af4, ; 562: lib_Xamarin.AndroidX.Camera.Core.dll.so => 172
	i64 u0x991d510397f92d9d, ; 563: System.Linq.Expressions => 242
	i64 u0x993cc632e821c001, ; 564: Microsoft.Maui.Controls.Compatibility => 131
	i64 u0x999cb19e1a04ffd3, ; 565: CommunityToolkit.Mvvm.dll => 63
	i64 u0x99a00ca5270c6878, ; 566: Xamarin.AndroidX.Navigation.Runtime => 191
	i64 u0x99a8098eef99f8b4, ; 567: Oracle.ManagedDataAccess.dll => 146
	i64 u0x99cdc6d1f2d3a72f, ; 568: ko/Microsoft.Maui.Controls.resources.dll => 29
	i64 u0x9a0cc42c6f36dfc9, ; 569: lib_Microsoft.IdentityModel.Protocols.dll.so => 128
	i64 u0x9a8abd23ef81c977, ; 570: NetTopologySuite.dll => 139
	i64 u0x9acfd25e735d5594, ; 571: lib_Npgsql.dll.so => 143
	i64 u0x9af128bb65641ae6, ; 572: NetTopologySuite.IO.SpatiaLite.dll => 140
	i64 u0x9b211a749105beac, ; 573: System.Transactions.Local => 298
	i64 u0x9c08d13c4e6dfa63, ; 574: Microsoft.EntityFrameworkCore.SqlServer.Abstractions => 110
	i64 u0x9c244ac7cda32d26, ; 575: System.Security.Cryptography.X509Certificates.dll => 285
	i64 u0x9cded46e202841cc, ; 576: NetTopologySuite.IO.SqlServerBytes.dll => 141
	i64 u0x9d5dbcf5a48583fe, ; 577: lib_Xamarin.AndroidX.Activity.dll.so => 168
	i64 u0x9d74dee1a7725f34, ; 578: Microsoft.Extensions.Configuration.Abstractions.dll => 115
	i64 u0x9da48bf5f6df6c80, ; 579: UraniumUI.dll => 166
	i64 u0x9e4534b6adaf6e84, ; 580: nl/Microsoft.Maui.Controls.resources => 32
	i64 u0x9eaf1efdf6f7267e, ; 581: Xamarin.AndroidX.Navigation.Common.dll => 189
	i64 u0x9ef542cf1f78c506, ; 582: Xamarin.AndroidX.Lifecycle.LiveData.Core => 185
	i64 u0x9fba0d4c57451526, ; 583: ko/Microsoft.SqlServer.Types.resources => 52
	i64 u0x9ff334e3cf272fd6, ; 584: lib_Xamarin.AndroidX.Camera.Lifecycle.dll.so => 173
	i64 u0x9ffbb6b1434ad2df, ; 585: Microsoft.Identity.Client.dll => 123
	i64 u0xa033e501b291e851, ; 586: itext.kernel => 91
	i64 u0xa0d8259f4cc284ec, ; 587: lib_System.Security.Cryptography.dll.so => 286
	i64 u0xa0e17ca50c77a225, ; 588: lib_Xamarin.Google.Crypto.Tink.Android.dll.so => 200
	i64 u0xa13763df740e071e, ; 589: store => 208
	i64 u0xa1440773ee9d341e, ; 590: Xamarin.Google.Android.Material => 199
	i64 u0xa1b9d7c27f47219f, ; 591: Xamarin.AndroidX.Navigation.UI.dll => 192
	i64 u0xa1cfec8d4a8d7c32, ; 592: Npgsql.EntityFrameworkCore.PostgreSQL.dll => 144
	i64 u0xa2572680829d2c7c, ; 593: System.IO.Pipelines.dll => 240
	i64 u0xa35eeea065361708, ; 594: QuestPDF => 148
	i64 u0xa375c81cb42e7ef8, ; 595: lib_Microsoft.EntityFrameworkCore.SqlServer.Abstractions.dll.so => 110
	i64 u0xa3c64c49e90a9987, ; 596: System.Security.Cryptography.Pkcs => 164
	i64 u0xa46aa1eaa214539b, ; 597: ko/Microsoft.Maui.Controls.resources => 29
	i64 u0xa4d20d2ff0563d26, ; 598: lib_CommunityToolkit.Mvvm.dll.so => 63
	i64 u0xa4edc8f2ceae241a, ; 599: System.Data.Common.dll => 223
	i64 u0xa526fadd66308051, ; 600: Microsoft.EntityFrameworkCore.SqlServer.dll => 109
	i64 u0xa5494f40f128ce6a, ; 601: System.Runtime.Serialization.Formatters.dll => 274
	i64 u0xa581c333c3c7cdb4, ; 602: ja/Microsoft.SqlServer.Types.resources => 51
	i64 u0xa5b7152421ed6d98, ; 603: lib_System.IO.FileSystem.Watcher.dll.so => 237
	i64 u0xa5b931bd164e087b, ; 604: Oracle.EntityFrameworkCore.dll => 145
	i64 u0xa5ce5c755bde8cb8, ; 605: lib_System.Security.Cryptography.Csp.dll.so => 282
	i64 u0xa5e599d1e0524750, ; 606: System.Numerics.Vectors.dll => 257
	i64 u0xa5f1ba49b85dd355, ; 607: System.Security.Cryptography.dll => 286
	i64 u0xa5f1e826b58a6998, ; 608: System.Linq.Async.dll => 161
	i64 u0xa60fdaa9af524b6a, ; 609: Microsoft.DotNet.PlatformAbstractions.dll => 104
	i64 u0xa61975a5a37873ea, ; 610: lib_System.Xml.XmlSerializer.dll.so => 303
	i64 u0xa67dbee13e1df9ca, ; 611: Xamarin.AndroidX.SavedState.dll => 194
	i64 u0xa684b098dd27b296, ; 612: lib_Xamarin.AndroidX.Security.SecurityCrypto.dll.so => 195
	i64 u0xa68a420042bb9b1f, ; 613: Xamarin.AndroidX.DrawerLayout.dll => 181
	i64 u0xa71fe7d6f6f93efd, ; 614: Microsoft.Data.SqlClient => 102
	i64 u0xa763fbb98df8d9fb, ; 615: lib_Microsoft.Win32.Primitives.dll.so => 210
	i64 u0xa78ce3745383236a, ; 616: Xamarin.AndroidX.Lifecycle.Common.Jvm => 184
	i64 u0xa7c31b56b4dc7b33, ; 617: hu/Microsoft.Maui.Controls.resources => 25
	i64 u0xa87ff9cd1c5ac806, ; 618: lib_MedallionTopologicalSort.dll.so => 100
	i64 u0xa8e6320dd07580ef, ; 619: lib_Microsoft.IdentityModel.JsonWebTokens.dll.so => 126
	i64 u0xa952cc4a0d808a59, ; 620: lib_Google.Api.CommonProtos.dll.so => 70
	i64 u0xa964304b5631e28a, ; 621: CommunityToolkit.Maui.Core.dll => 62
	i64 u0xaa2219c8e3449ff5, ; 622: Microsoft.Extensions.Logging.Abstractions => 120
	i64 u0xaa443ac34067eeef, ; 623: System.Private.Xml.dll => 262
	i64 u0xaa52de307ef5d1dd, ; 624: System.Net.Http => 247
	i64 u0xaa9a7b0214a5cc5c, ; 625: System.Diagnostics.StackTrace.dll => 227
	i64 u0xaaaf86367285a918, ; 626: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 117
	i64 u0xaaf84bb3f052a265, ; 627: el/Microsoft.Maui.Controls.resources => 18
	i64 u0xab375658f5084c9f, ; 628: lib_Google.Cloud.Firestore.dll.so => 77
	i64 u0xab9c1b2687d86b0b, ; 629: lib_System.Linq.Expressions.dll.so => 242
	i64 u0xabc4d26016505655, ; 630: lib_Microsoft.SqlServer.Types.dll.so => 138
	i64 u0xac2af3fa195a15ce, ; 631: System.Runtime.Numerics => 273
	i64 u0xac5376a2a538dc10, ; 632: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 185
	i64 u0xac65e40f62b6b90e, ; 633: Google.Protobuf => 81
	i64 u0xac79c7e46047ad98, ; 634: System.Security.Principal.Windows.dll => 287
	i64 u0xac98d31068e24591, ; 635: System.Xml.XDocument => 302
	i64 u0xacd46e002c3ccb97, ; 636: ro/Microsoft.Maui.Controls.resources => 36
	i64 u0xacf42eea7ef9cd12, ; 637: System.Threading.Channels => 293
	i64 u0xacf6fdf873a3ce67, ; 638: lib_itext.bouncy-castle-connector.dll.so => 88
	i64 u0xad89c07347f1bad6, ; 639: nl/Microsoft.Maui.Controls.resources.dll => 32
	i64 u0xadbb53caf78a79d2, ; 640: System.Web.HttpUtility => 299
	i64 u0xadc90ab061a9e6e4, ; 641: System.ComponentModel.TypeConverter.dll => 220
	i64 u0xadf511667bef3595, ; 642: System.Net.Security => 253
	i64 u0xae282bcd03739de7, ; 643: Java.Interop => 307
	i64 u0xae53579c90db1107, ; 644: System.ObjectModel.dll => 258
	i64 u0xaf12fb8133ac3fbb, ; 645: Microsoft.EntityFrameworkCore.Sqlite => 108
	i64 u0xaf2e760f9c91cb86, ; 646: itext.layout => 92
	i64 u0xafe29f45095518e7, ; 647: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 187
	i64 u0xb05cc42cd94c6d9d, ; 648: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 39
	i64 u0xb0bb43dc52ea59f9, ; 649: System.Diagnostics.Tracing.dll => 230
	i64 u0xb1dd05401aa8ee63, ; 650: System.Security.AccessControl => 279
	i64 u0xb220631954820169, ; 651: System.Text.RegularExpressions => 292
	i64 u0xb2376e1dbf8b4ed7, ; 652: System.Security.Cryptography.Csp => 282
	i64 u0xb27d64a740cc8c9c, ; 653: lib_itext.styledxmlparser.dll.so => 96
	i64 u0xb2a3f67f3bf29fce, ; 654: da/Microsoft.Maui.Controls.resources => 16
	i64 u0xb2d3ad98fce223fd, ; 655: UraniumUI.Material => 167
	i64 u0xb398860d6ed7ba2f, ; 656: System.Security.Cryptography.ProtectedData => 165
	i64 u0xb39eed1decc0cd95, ; 657: Google.Api.Gax.dll => 71
	i64 u0xb3f0a0fcda8d3ebc, ; 658: Xamarin.AndroidX.CardView => 175
	i64 u0xb4512edf6d2b372b, ; 659: Google.Cloud.Location => 79
	i64 u0xb46be1aa6d4fff93, ; 660: hi/Microsoft.Maui.Controls.resources => 23
	i64 u0xb477491be13109d8, ; 661: ar/Microsoft.Maui.Controls.resources => 13
	i64 u0xb4bd7015ecee9d86, ; 662: System.IO.Pipelines => 240
	i64 u0xb4c53d9749c5f226, ; 663: lib_System.IO.FileSystem.AccessControl.dll.so => 236
	i64 u0xb4c8142c581fa7a2, ; 664: itext.forms.dll => 89
	i64 u0xb4ff710863453fda, ; 665: System.Diagnostics.FileVersionInfo.dll => 225
	i64 u0xb50d9ae4eea71e97, ; 666: lib_Microsoft.DotNet.PlatformAbstractions.dll.so => 104
	i64 u0xb5c7fcdafbc67ee4, ; 667: Microsoft.Extensions.Logging.Abstractions.dll => 120
	i64 u0xb5ea31d5244c6626, ; 668: System.Threading.ThreadPool.dll => 296
	i64 u0xb6ca291529a2056e, ; 669: MedallionTopologicalSort.dll => 100
	i64 u0xb71e58d502bd29dc, ; 670: itext.styledxmlparser.dll => 96
	i64 u0xb7212c4683a94afe, ; 671: System.Drawing.Primitives => 231
	i64 u0xb7b7753d1f319409, ; 672: sv/Microsoft.Maui.Controls.resources => 39
	i64 u0xb81a2c6e0aee50fe, ; 673: lib_System.Private.CoreLib.dll.so => 306
	i64 u0xb898d1802c1a108c, ; 674: lib_System.Management.dll.so => 162
	i64 u0xb90ff82c284e9af9, ; 675: Grpc.Core.Api => 83
	i64 u0xb9185c33a1643eed, ; 676: Microsoft.CSharp.dll => 209
	i64 u0xb9f64d3b230def68, ; 677: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 35
	i64 u0xb9fc3c8a556e3691, ; 678: ja/Microsoft.Maui.Controls.resources => 28
	i64 u0xba0f52acac7e7a84, ; 679: itext.kernel.dll => 91
	i64 u0xba4670aa94a2b3c6, ; 680: lib_System.Xml.XDocument.dll.so => 302
	i64 u0xba48785529705af9, ; 681: System.Collections.dll => 217
	i64 u0xbb6026d73f757bcf, ; 682: Google.Api.Gax.Grpc => 72
	i64 u0xbb65706fde942ce3, ; 683: System.Net.Sockets => 254
	i64 u0xbb6dc0b35452c1a0, ; 684: ZXing.Net.MAUI.dll => 206
	i64 u0xbb8c8d165ef11460, ; 685: lib_Microsoft.Identity.Client.Extensions.Msal.dll.so => 124
	i64 u0xbbd180354b67271a, ; 686: System.Runtime.Serialization.Formatters => 274
	i64 u0xbc22a245dab70cb4, ; 687: lib_SQLitePCLRaw.provider.e_sqlite3.dll.so => 152
	i64 u0xbc41034a90e7d095, ; 688: lib_itext.forms.dll.so => 89
	i64 u0xbcd22b365b764643, ; 689: lib-zh-Hans-Microsoft.Data.SqlClient.resources.dll.so => 11
	i64 u0xbcef2cc19d49603f, ; 690: EFCore.BulkExtensions.PostgreSql.dll => 66
	i64 u0xbd0aaf9dbfcc3376, ; 691: fr/Microsoft.Data.SqlClient.resources.dll => 3
	i64 u0xbd0e2c0d55246576, ; 692: System.Net.Http.dll => 247
	i64 u0xbd3c2d7a8325e11b, ; 693: lib-fr-Microsoft.Data.SqlClient.resources.dll.so => 3
	i64 u0xbd3fbd85b9e1cb29, ; 694: lib_System.Net.HttpListener.dll.so => 248
	i64 u0xbd437a2cdb333d0d, ; 695: Xamarin.AndroidX.ViewPager2 => 198
	i64 u0xbd4aef17dbfb0390, ; 696: ru/Microsoft.Data.SqlClient.resources => 9
	i64 u0xbd5d0b88d3d647a5, ; 697: lib_Xamarin.AndroidX.Browser.dll.so => 171
	i64 u0xbd7d91e34beaf455, ; 698: itext.sign.dll => 95
	i64 u0xbd877b14d0b56392, ; 699: System.Runtime.Intrinsics.dll => 271
	i64 u0xbe08e3083025c53d, ; 700: ZXing.Net.MAUI.Controls.dll => 207
	i64 u0xbe532a80075c3dc8, ; 701: Xamarin.AndroidX.Camera.Core.dll => 172
	i64 u0xbe65a49036345cf4, ; 702: lib_System.Buffers.dll.so => 212
	i64 u0xbee38d4a88835966, ; 703: Xamarin.AndroidX.AppCompat.AppCompatResources => 170
	i64 u0xbfc1e1fb3095f2b3, ; 704: lib_System.Net.Http.Json.dll.so => 246
	i64 u0xc040a4ab55817f58, ; 705: ar/Microsoft.Maui.Controls.resources.dll => 13
	i64 u0xc0ca0108a1384ed5, ; 706: lib_EFCore.BulkExtensions.Core.dll.so => 64
	i64 u0xc0d928351ab5ca77, ; 707: System.Console.dll => 222
	i64 u0xc0f5a221a9383aea, ; 708: System.Runtime.Intrinsics => 271
	i64 u0xc1182977a92df85f, ; 709: lib-fr-Microsoft.SqlServer.Types.resources.dll.so => 49
	i64 u0xc12b8b3afa48329c, ; 710: lib_System.Linq.dll.so => 244
	i64 u0xc1649f545b2f76aa, ; 711: Grpc.Auth => 82
	i64 u0xc1c2cb7af77b8858, ; 712: Microsoft.EntityFrameworkCore => 105
	i64 u0xc1ff9ae3cdb6e1e6, ; 713: Xamarin.AndroidX.Activity.dll => 168
	i64 u0xc2260e1da1054ac1, ; 714: lib_BouncyCastle.Cryptography.dll.so => 60
	i64 u0xc26c064effb1dea9, ; 715: System.Buffers.dll => 212
	i64 u0xc278de356ad8a9e3, ; 716: Microsoft.IdentityModel.Logging => 127
	i64 u0xc2850fbba221599d, ; 717: lib_Google.Apis.Core.dll.so => 76
	i64 u0xc28c50f32f81cc73, ; 718: ja/Microsoft.Maui.Controls.resources.dll => 28
	i64 u0xc2a3bca55b573141, ; 719: System.IO.FileSystem.Watcher => 237
	i64 u0xc2bcfec99f69365e, ; 720: Xamarin.AndroidX.ViewPager2.dll => 198
	i64 u0xc2eb95e1f02ee46b, ; 721: it/Microsoft.SqlServer.Types.resources.dll => 50
	i64 u0xc30b52815b58ac2c, ; 722: lib_System.Runtime.Serialization.Xml.dll.so => 277
	i64 u0xc3492f8f90f96ce4, ; 723: lib_Microsoft.Extensions.DependencyModel.dll.so => 118
	i64 u0xc3f0e03e56ce7b69, ; 724: zxing => 205
	i64 u0xc463e077917aa21d, ; 725: System.Runtime.Serialization.Json => 275
	i64 u0xc472ce300460ccb6, ; 726: Microsoft.EntityFrameworkCore.dll => 105
	i64 u0xc4d3858ed4d08512, ; 727: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 187
	i64 u0xc4d69851fe06342f, ; 728: lib_Microsoft.Extensions.Caching.Memory.dll.so => 113
	i64 u0xc50fded0ded1418c, ; 729: lib_System.ComponentModel.TypeConverter.dll.so => 220
	i64 u0xc519125d6bc8fb11, ; 730: lib_System.Net.Requests.dll.so => 252
	i64 u0xc5293b19e4dc230e, ; 731: Xamarin.AndroidX.Navigation.Fragment => 190
	i64 u0xc5325b2fcb37446f, ; 732: lib_System.Private.Xml.dll.so => 262
	i64 u0xc583d8477b5d3bac, ; 733: zh-Hant/Microsoft.Data.SqlClient.resources.dll => 12
	i64 u0xc5a0f4b95a699af7, ; 734: lib_System.Private.Uri.dll.so => 260
	i64 u0xc5cdcd5b6277579e, ; 735: lib_System.Security.Cryptography.Algorithms.dll.so => 281
	i64 u0xc5d608afb58abba2, ; 736: Google.Apis.Auth.dll => 75
	i64 u0xc7c01e7d7c93a110, ; 737: System.Text.Encoding.Extensions.dll => 289
	i64 u0xc7ce851898a4548e, ; 738: lib_System.Web.HttpUtility.dll.so => 299
	i64 u0xc858a28d9ee5a6c5, ; 739: lib_System.Collections.Specialized.dll.so => 216
	i64 u0xc95a1178aef91462, ; 740: lib_Microsoft.EntityFrameworkCore.SqlServer.HierarchyId.dll.so => 111
	i64 u0xc9c62c8f354ac568, ; 741: lib_System.Diagnostics.TextWriterTraceListener.dll.so => 228
	i64 u0xc9d61d6a8d51fe6c, ; 742: lib_NetTopologySuite.IO.SqlServerBytes.dll.so => 141
	i64 u0xc9e54b32fc19baf3, ; 743: lib_CommunityToolkit.Maui.dll.so => 61
	i64 u0xca32340d8d54dcd5, ; 744: Microsoft.Extensions.Caching.Memory.dll => 113
	i64 u0xca3a723e7342c5b6, ; 745: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 41
	i64 u0xcab3493c70141c2d, ; 746: pl/Microsoft.Maui.Controls.resources => 33
	i64 u0xcacfddc9f7c6de76, ; 747: ro/Microsoft.Maui.Controls.resources.dll => 36
	i64 u0xcb45618372c47127, ; 748: Microsoft.EntityFrameworkCore.Relational => 107
	i64 u0xcb6f731cbdfa3dd8, ; 749: Npgsql.EntityFrameworkCore.PostgreSQL => 144
	i64 u0xcbd4fdd9cef4a294, ; 750: lib__Microsoft.Android.Resource.Designer.dll.so => 57
	i64 u0xcc182c3afdc374d6, ; 751: Microsoft.Bcl.AsyncInterfaces => 101
	i64 u0xcc2876b32ef2794c, ; 752: lib_System.Text.RegularExpressions.dll.so => 292
	i64 u0xcc5c3bb714c4561e, ; 753: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 203
	i64 u0xcc76886e09b88260, ; 754: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 204
	i64 u0xccf25c4b634ccd3a, ; 755: zh-Hans/Microsoft.Maui.Controls.resources.dll => 45
	i64 u0xcd10a42808629144, ; 756: System.Net.Requests => 252
	i64 u0xcd235365bb1cf97f, ; 757: lib_itext.svg.dll.so => 97
	i64 u0xcdd0c48b6937b21c, ; 758: Xamarin.AndroidX.SwipeRefreshLayout => 196
	i64 u0xce366153aaa26f70, ; 759: System.DirectoryServices.Protocols.dll => 159
	i64 u0xceb28d385f84f441, ; 760: Azure.Core.dll => 58
	i64 u0xcf140ed700bc8e66, ; 761: Microsoft.SqlServer.Server.dll => 137
	i64 u0xcf23d8093f3ceadf, ; 762: System.Diagnostics.DiagnosticSource.dll => 224
	i64 u0xcf4d55b5fe223cd6, ; 763: NetTopologySuite.IO.SqlServerBytes => 141
	i64 u0xcf8fc898f98b0d34, ; 764: System.Private.Xml.Linq => 261
	i64 u0xcfa869564d903308, ; 765: EFCore.BulkExtensions.Core => 64
	i64 u0xd04b5f59ed596e31, ; 766: System.Reflection.Metadata.dll => 265
	i64 u0xd063299fcfc0c93f, ; 767: lib_System.Runtime.Serialization.Json.dll.so => 275
	i64 u0xd0af5414344dd23a, ; 768: itext.io => 90
	i64 u0xd0de8a113e976700, ; 769: System.Diagnostics.TextWriterTraceListener => 228
	i64 u0xd0fc33d5ae5d4cb8, ; 770: System.Runtime.Extensions => 268
	i64 u0xd1194e1d8a8de83c, ; 771: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 184
	i64 u0xd1dcf65a5c5b2e92, ; 772: itext.pdfa => 93
	i64 u0xd22a0c4630f2fe66, ; 773: lib_System.Security.Cryptography.ProtectedData.dll.so => 165
	i64 u0xd2b39754bb800974, ; 774: es/Microsoft.SqlServer.Types.resources => 48
	i64 u0xd2dffb59201927bd, ; 775: de/Microsoft.Data.SqlClient.resources.dll => 1
	i64 u0xd3144156a3727ebe, ; 776: Xamarin.Google.Guava.ListenableFuture => 201
	i64 u0xd333d0af9e423810, ; 777: System.Runtime.InteropServices => 270
	i64 u0xd33a415cb4278969, ; 778: System.Security.Cryptography.Encoding.dll => 283
	i64 u0xd3426d966bb704f5, ; 779: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 170
	i64 u0xd3651b6fc3125825, ; 780: System.Private.Uri.dll => 260
	i64 u0xd373685349b1fe8b, ; 781: Microsoft.Extensions.Logging.dll => 119
	i64 u0xd3801faafafb7698, ; 782: System.Private.DataContractSerialization.dll => 259
	i64 u0xd3e4c8d6a2d5d470, ; 783: it/Microsoft.Maui.Controls.resources => 27
	i64 u0xd42655883bb8c19f, ; 784: Microsoft.EntityFrameworkCore.Abstractions.dll => 106
	i64 u0xd4645626dffec99d, ; 785: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 117
	i64 u0xd5507e11a2b2839f, ; 786: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 187
	i64 u0xd567f168deeeaf3c, ; 787: lib_zxing.dll.so => 205
	i64 u0xd5858610826f1c08, ; 788: lib-ru-Microsoft.Data.SqlClient.resources.dll.so => 9
	i64 u0xd63b432ec9306914, ; 789: zxing.dll => 205
	i64 u0xd64f50eb4ba264b3, ; 790: lib_Google.LongRunning.dll.so => 80
	i64 u0xd6694f8359737e4e, ; 791: Xamarin.AndroidX.SavedState => 194
	i64 u0xd67e431fe2ca996e, ; 792: zh-Hans/Microsoft.SqlServer.Types.resources.dll => 55
	i64 u0xd6d21782156bc35b, ; 793: Xamarin.AndroidX.SwipeRefreshLayout.dll => 196
	i64 u0xd71fa7ed9848efec, ; 794: lib_itext.bouncy-castle-adapter.dll.so => 98
	i64 u0xd72329819cbbbc44, ; 795: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 115
	i64 u0xd72c760af136e863, ; 796: System.Xml.XmlSerializer.dll => 303
	i64 u0xd7b3764ada9d341d, ; 797: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 120
	i64 u0xd8113d9a7e8ad136, ; 798: System.CodeDom => 154
	i64 u0xd9d04d95a2671e29, ; 799: lib_ZXing.Net.MAUI.Controls.dll.so => 207
	i64 u0xd9e245a1762ddad5, ; 800: BouncyCastle.Cryptography => 60
	i64 u0xd9fc7e791253de8f, ; 801: lib_itext.commons.dll.so => 99
	i64 u0xda1dfa4c534a9251, ; 802: Microsoft.Extensions.DependencyInjection => 116
	i64 u0xdad05a11827959a3, ; 803: System.Collections.NonGeneric.dll => 215
	i64 u0xdb5383ab5865c007, ; 804: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 43
	i64 u0xdb58816721c02a59, ; 805: lib_System.Reflection.Emit.ILGeneration.dll.so => 263
	i64 u0xdbc296dc8fc262d3, ; 806: FirebaseAdmin => 69
	i64 u0xdbeda89f832aa805, ; 807: vi/Microsoft.Maui.Controls.resources.dll => 43
	i64 u0xdbf2a779fbc3ac31, ; 808: System.Transactions.Local.dll => 298
	i64 u0xdbf9607a441b4505, ; 809: System.Linq => 244
	i64 u0xdc75032002d1a212, ; 810: lib_System.Transactions.Local.dll.so => 298
	i64 u0xdca8be7403f92d4f, ; 811: lib_System.Linq.Queryable.dll.so => 243
	i64 u0xdcbd21904ff0f297, ; 812: Google.Apis => 74
	i64 u0xdce2c53525640bf3, ; 813: Microsoft.Extensions.Logging => 119
	i64 u0xdd2b722d78ef5f43, ; 814: System.Runtime.dll => 278
	i64 u0xdd67031857c72f96, ; 815: lib_System.Text.Encodings.Web.dll.so => 290
	i64 u0xdde30e6b77aa6f6c, ; 816: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 45
	i64 u0xde110ae80fa7c2e2, ; 817: System.Xml.XDocument.dll => 302
	i64 u0xde572c2b2fb32f93, ; 818: lib_System.Threading.Tasks.Extensions.dll.so => 294
	i64 u0xde8769ebda7d8647, ; 819: hr/Microsoft.Maui.Controls.resources.dll => 24
	i64 u0xdfe60c16084f6d57, ; 820: itext.pdfua.dll => 94
	i64 u0xe0142572c095a480, ; 821: Xamarin.AndroidX.AppCompat.dll => 169
	i64 u0xe02f89350ec78051, ; 822: Xamarin.AndroidX.CoordinatorLayout.dll => 177
	i64 u0xe0ea30f1ac5b7731, ; 823: ko/Microsoft.Data.SqlClient.resources.dll => 6
	i64 u0xe0ee2e61123c1478, ; 824: lib-es-Microsoft.Data.SqlClient.resources.dll.so => 2
	i64 u0xe10b760bb1462e7a, ; 825: lib_System.Security.Cryptography.Primitives.dll.so => 284
	i64 u0xe12265280d0b036d, ; 826: fr/Microsoft.Data.SqlClient.resources => 3
	i64 u0xe192a588d4410686, ; 827: lib_System.IO.Pipelines.dll.so => 240
	i64 u0xe1a08bd3fa539e0d, ; 828: System.Runtime.Loader => 272
	i64 u0xe1b52f9f816c70ef, ; 829: System.Private.Xml.Linq.dll => 261
	i64 u0xe1ecfdb7fff86067, ; 830: System.Net.Security.dll => 253
	i64 u0xe22fa4c9c645db62, ; 831: System.Diagnostics.TextWriterTraceListener.dll => 228
	i64 u0xe2420585aeceb728, ; 832: System.Net.Requests.dll => 252
	i64 u0xe29b73bc11392966, ; 833: lib-id-Microsoft.Maui.Controls.resources.dll.so => 26
	i64 u0xe2e426c7714fa0bc, ; 834: Microsoft.Win32.Primitives.dll => 210
	i64 u0xe3811d68d4fe8463, ; 835: pt-BR/Microsoft.Maui.Controls.resources.dll => 34
	i64 u0xe3b7cbae5ad66c75, ; 836: lib_System.Security.Cryptography.Encoding.dll.so => 283
	i64 u0xe494f7ced4ecd10a, ; 837: hu/Microsoft.Maui.Controls.resources.dll => 25
	i64 u0xe49a982a2533a332, ; 838: lib_Google.Cloud.Location.dll.so => 79
	i64 u0xe4a9b1e40d1e8917, ; 839: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 20
	i64 u0xe4f74a0b5bf9703f, ; 840: System.Runtime.Serialization.Primitives => 276
	i64 u0xe5434e8a119ceb69, ; 841: lib_Mono.Android.dll.so => 309
	i64 u0xe57d22ca4aeb4900, ; 842: System.Configuration.ConfigurationManager => 155
	i64 u0xe67e4f4689949049, ; 843: zh-Hans/Microsoft.SqlServer.Types.resources => 55
	i64 u0xe6e77c648688b75b, ; 844: Google.Api.CommonProtos.dll => 70
	i64 u0xe7b0691bcbb5a85d, ; 845: System.Linq.Async => 161
	i64 u0xe7e03cc18dcdeb49, ; 846: lib_System.Diagnostics.StackTrace.dll.so => 227
	i64 u0xe8159f0f339a522f, ; 847: lib_itext.barcodes.dll.so => 87
	i64 u0xe89a2a9ef110899b, ; 848: System.Drawing.dll => 232
	i64 u0xe98b0e4b4d44e931, ; 849: lib_Grpc.Net.Client.dll.so => 84
	i64 u0xeae68e81c894c13d, ; 850: UraniumUI.Material.dll => 167
	i64 u0xeaf8e9970fc2fe69, ; 851: System.Management => 162
	i64 u0xed6ef763c6fb395f, ; 852: System.Diagnostics.EventLog.dll => 157
	i64 u0xed88ac16d5217c50, ; 853: lib_EFCore.BulkExtensions.Oracle.dll.so => 65
	i64 u0xedc4817167106c23, ; 854: System.Net.Sockets.dll => 254
	i64 u0xedc632067fb20ff3, ; 855: System.Memory.dll => 245
	i64 u0xedc8e4ca71a02a8b, ; 856: Xamarin.AndroidX.Navigation.Runtime.dll => 191
	i64 u0xee04c435dc04d4d7, ; 857: EFCore.BulkExtensions.Core.dll => 64
	i64 u0xee81f5b3f1c4f83b, ; 858: System.Threading.ThreadPool => 296
	i64 u0xeeb7ebb80150501b, ; 859: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 176
	i64 u0xeef850486aa78956, ; 860: lib-de-Microsoft.SqlServer.Types.resources.dll.so => 47
	i64 u0xef03b1b5a04e9709, ; 861: System.Text.Encoding.CodePages.dll => 288
	i64 u0xef2f805e5d8b8230, ; 862: lib_Oracle.ManagedDataAccess.dll.so => 146
	i64 u0xef602c523fe2e87a, ; 863: lib_Xamarin.Google.Guava.ListenableFuture.dll.so => 201
	i64 u0xef6e6d3ed7611955, ; 864: itext.forms => 89
	i64 u0xef72742e1bcca27a, ; 865: Microsoft.Maui.Essentials.dll => 135
	i64 u0xefd0396433f04886, ; 866: pt-BR/Microsoft.Data.SqlClient.resources => 8
	i64 u0xefe24f02e90841a9, ; 867: ru/Microsoft.SqlServer.Types.resources.dll => 54
	i64 u0xefec0b7fdc57ec42, ; 868: Xamarin.AndroidX.Activity => 168
	i64 u0xf008bcd238ede2c8, ; 869: System.CodeDom.dll => 154
	i64 u0xf00c29406ea45e19, ; 870: es/Microsoft.Maui.Controls.resources.dll => 19
	i64 u0xf09e47b6ae914f6e, ; 871: System.Net.NameResolution => 249
	i64 u0xf0de2537ee19c6ca, ; 872: lib_System.Net.WebHeaderCollection.dll.so => 256
	i64 u0xf11b621fc87b983f, ; 873: Microsoft.Maui.Controls.Xaml.dll => 133
	i64 u0xf1c4b4005493d871, ; 874: System.Formats.Asn1.dll => 233
	i64 u0xf238bd79489d3a96, ; 875: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 32
	i64 u0xf25203d36c6e85c4, ; 876: lib-ja-Microsoft.SqlServer.Types.resources.dll.so => 51
	i64 u0xf37221fda4ef8830, ; 877: lib_Xamarin.Google.Android.Material.dll.so => 199
	i64 u0xf3ddfe05336abf29, ; 878: System => 304
	i64 u0xf408654b2a135055, ; 879: System.Reflection.Emit.ILGeneration.dll => 263
	i64 u0xf4103170a1de5bd0, ; 880: System.Linq.Queryable.dll => 243
	i64 u0xf4c1dd70a5496a17, ; 881: System.IO.Compression => 235
	i64 u0xf502029ca9ac09c4, ; 882: Microsoft.EntityFrameworkCore.SqlServer.HierarchyId.dll => 111
	i64 u0xf5e59d7ac34b50aa, ; 883: Microsoft.IdentityModel.Protocols.dll => 128
	i64 u0xf5fc7602fe27b333, ; 884: System.Net.WebHeaderCollection => 256
	i64 u0xf6077741019d7428, ; 885: Xamarin.AndroidX.CoordinatorLayout => 177
	i64 u0xf61ade9836ad4692, ; 886: Microsoft.IdentityModel.Tokens.dll => 130
	i64 u0xf6ae7832fd9c9009, ; 887: lib-it-Microsoft.SqlServer.Types.resources.dll.so => 50
	i64 u0xf6c0e7d55a7a4e4f, ; 888: Microsoft.IdentityModel.JsonWebTokens => 126
	i64 u0xf7166e040fdf96f5, ; 889: lib_itext.pdfua.dll.so => 94
	i64 u0xf77b20923f07c667, ; 890: de/Microsoft.Maui.Controls.resources.dll => 17
	i64 u0xf79cbf52994c8548, ; 891: Npgsql => 143
	i64 u0xf7be8a85d06b4b64, ; 892: ru/Microsoft.Data.SqlClient.resources.dll => 9
	i64 u0xf7e2cac4c45067b3, ; 893: lib_System.Numerics.Vectors.dll.so => 257
	i64 u0xf7e74930e0e3d214, ; 894: zh-HK/Microsoft.Maui.Controls.resources.dll => 44
	i64 u0xf7fa0bf77fe677cc, ; 895: Newtonsoft.Json.dll => 142
	i64 u0xf83775f330791063, ; 896: ja/Microsoft.Data.SqlClient.resources.dll => 5
	i64 u0xf84773b5c81e3cef, ; 897: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 42
	i64 u0xf8aac5ea82de1348, ; 898: System.Linq.Queryable => 243
	i64 u0xf8abd63acd77d37b, ; 899: Xamarin.AndroidX.Camera.View => 174
	i64 u0xf8b77539b362d3ba, ; 900: lib_System.Reflection.Primitives.dll.so => 266
	i64 u0xf8cd217ba1bbfdc8, ; 901: lib-zh-Hant-Microsoft.Data.SqlClient.resources.dll.so => 12
	i64 u0xf8e045dc345b2ea3, ; 902: lib_Xamarin.AndroidX.RecyclerView.dll.so => 193
	i64 u0xf915dc29808193a1, ; 903: System.Web.HttpUtility.dll => 299
	i64 u0xf95306fe01fadbd0, ; 904: itext.commons.dll => 99
	i64 u0xf96c777a2a0686f4, ; 905: hi/Microsoft.Maui.Controls.resources.dll => 23
	i64 u0xf9be54c8bcf8ff3b, ; 906: System.Security.AccessControl.dll => 279
	i64 u0xf9eec5bb3a6aedc6, ; 907: Microsoft.Extensions.Options => 121
	i64 u0xfa0e82300e67f913, ; 908: lib_System.AppContext.dll.so => 211
	i64 u0xfa3f278f288b0e84, ; 909: lib_System.Net.Security.dll.so => 253
	i64 u0xfa5ed7226d978949, ; 910: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 13
	i64 u0xfa645d91e9fc4cba, ; 911: System.Threading.Thread => 295
	i64 u0xfae3bcd3a0b1572a, ; 912: lib_itext.layout.dll.so => 92
	i64 u0xfaef53f942a29695, ; 913: pt-BR/Microsoft.SqlServer.Types.resources => 53
	i64 u0xfb022853d73b7fa5, ; 914: lib_SQLitePCLRaw.batteries_v2.dll.so => 149
	i64 u0xfbad3e4ce4b98145, ; 915: System.Security.Cryptography.X509Certificates => 285
	i64 u0xfbf0a31c9fc34bc4, ; 916: lib_System.Net.Http.dll.so => 247
	i64 u0xfc6b7527cc280b3f, ; 917: lib_System.Runtime.Serialization.Formatters.dll.so => 274
	i64 u0xfc719aec26adf9d9, ; 918: Xamarin.AndroidX.Navigation.Fragment.dll => 190
	i64 u0xfcd302092ada6328, ; 919: System.IO.MemoryMappedFiles.dll => 239
	i64 u0xfcd5b90cf101e36b, ; 920: System.Data.SqlClient.dll => 156
	i64 u0xfd22f00870e40ae0, ; 921: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 181
	i64 u0xfd49b3c1a76e2748, ; 922: System.Runtime.InteropServices.RuntimeInformation => 269
	i64 u0xfd536c702f64dc47, ; 923: System.Text.Encoding.Extensions => 289
	i64 u0xfd583f7657b6a1cb, ; 924: Xamarin.AndroidX.Fragment => 182
	i64 u0xfdbe4710aa9beeff, ; 925: CommunityToolkit.Maui => 61
	i64 u0xfddbe9695626a7f5, ; 926: Xamarin.AndroidX.Lifecycle.Common => 183
	i64 u0xfeae9952cf03b8cb, ; 927: tr/Microsoft.Maui.Controls.resources => 41
	i64 u0xff9b54613e0d2cc8, ; 928: System.Net.Http.Json => 246
	i64 u0xfff40914e0b38d3d ; 929: Azure.Identity.dll => 59
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [930 x i32] [
	i32 78, i32 139, i32 1, i32 196, i32 138, i32 218, i32 206, i32 84,
	i32 191, i32 62, i32 164, i32 6, i32 113, i32 308, i32 169, i32 212,
	i32 152, i32 259, i32 37, i32 15, i32 43, i32 125, i32 251, i32 51,
	i32 193, i32 103, i32 217, i32 134, i32 267, i32 138, i32 12, i32 103,
	i32 10, i32 44, i32 300, i32 176, i32 37, i32 215, i32 4, i32 58,
	i32 266, i32 56, i32 181, i32 96, i32 218, i32 121, i32 215, i32 163,
	i32 286, i32 265, i32 112, i32 293, i32 102, i32 67, i32 38, i32 204,
	i32 197, i32 154, i32 34, i32 173, i32 309, i32 159, i32 135, i32 195,
	i32 101, i32 83, i32 65, i32 249, i32 248, i32 5, i32 101, i32 180,
	i32 2, i32 234, i32 284, i32 50, i32 264, i32 73, i32 193, i32 129,
	i32 78, i32 171, i32 21, i32 307, i32 22, i32 129, i32 117, i32 66,
	i32 94, i32 210, i32 157, i32 238, i32 118, i32 1, i32 241, i32 281,
	i32 305, i32 279, i32 144, i32 25, i32 290, i32 204, i32 255, i32 31,
	i32 280, i32 98, i32 174, i32 166, i32 161, i32 59, i32 213, i32 304,
	i32 40, i32 47, i32 308, i32 75, i32 47, i32 131, i32 195, i32 236,
	i32 81, i32 227, i32 192, i32 29, i32 121, i32 303, i32 225, i32 255,
	i32 65, i32 234, i32 69, i32 71, i32 226, i32 278, i32 153, i32 263,
	i32 40, i32 241, i32 88, i32 295, i32 105, i32 71, i32 0, i32 222,
	i32 178, i32 276, i32 82, i32 75, i32 21, i32 200, i32 149, i32 202,
	i32 122, i32 172, i32 56, i32 160, i32 26, i32 24, i32 200, i32 307,
	i32 148, i32 251, i32 48, i32 42, i32 250, i32 229, i32 95, i32 20,
	i32 292, i32 160, i32 233, i32 46, i32 93, i32 33, i32 288, i32 264,
	i32 261, i32 8, i32 297, i32 39, i32 291, i32 238, i32 18, i32 68,
	i32 226, i32 301, i32 137, i32 230, i32 112, i32 182, i32 125, i32 140,
	i32 57, i32 175, i32 55, i32 231, i32 97, i32 21, i32 301, i32 214,
	i32 19, i32 79, i32 254, i32 137, i32 158, i32 86, i32 134, i32 15,
	i32 132, i32 218, i32 198, i32 114, i32 271, i32 143, i32 268, i32 264,
	i32 239, i32 166, i32 49, i32 266, i32 72, i32 214, i32 267, i32 67,
	i32 180, i32 249, i32 128, i32 155, i32 197, i32 14, i32 142, i32 208,
	i32 87, i32 284, i32 289, i32 130, i32 285, i32 80, i32 102, i32 202,
	i32 171, i32 207, i32 156, i32 201, i32 296, i32 300, i32 178, i32 149,
	i32 81, i32 80, i32 4, i32 124, i32 294, i32 148, i32 189, i32 158,
	i32 59, i32 139, i32 72, i32 155, i32 170, i32 87, i32 77, i32 70,
	i32 162, i32 305, i32 309, i32 208, i32 33, i32 54, i32 209, i32 276,
	i32 202, i32 106, i32 160, i32 74, i32 229, i32 211, i32 118, i32 98,
	i32 37, i32 300, i32 85, i32 163, i32 35, i32 239, i32 258, i32 192,
	i32 268, i32 236, i32 291, i32 153, i32 246, i32 107, i32 188, i32 250,
	i32 73, i32 242, i32 262, i32 153, i32 86, i32 272, i32 131, i32 27,
	i32 188, i32 308, i32 288, i32 90, i32 293, i32 14, i32 0, i32 48,
	i32 90, i32 151, i32 130, i32 4, i32 132, i32 111, i32 85, i32 69,
	i32 63, i32 91, i32 186, i32 5, i32 232, i32 251, i32 85, i32 223,
	i32 11, i32 95, i32 178, i32 136, i32 146, i32 38, i32 250, i32 269,
	i32 44, i32 104, i32 280, i32 278, i32 183, i32 76, i32 184, i32 216,
	i32 277, i32 260, i32 150, i32 306, i32 224, i32 28, i32 116, i32 209,
	i32 82, i32 163, i32 177, i32 297, i32 221, i32 259, i32 16, i32 156,
	i32 119, i32 225, i32 53, i32 256, i32 206, i32 8, i32 7, i32 270,
	i32 176, i32 216, i32 290, i32 219, i32 282, i32 248, i32 67, i32 301,
	i32 223, i32 54, i32 151, i32 18, i32 267, i32 116, i32 203, i32 245,
	i32 133, i32 17, i32 272, i32 0, i32 306, i32 10, i32 93, i32 214,
	i32 199, i32 281, i32 110, i32 73, i32 61, i32 132, i32 273, i32 222,
	i32 186, i32 179, i32 52, i32 158, i32 16, i32 231, i32 233, i32 22,
	i32 151, i32 270, i32 31, i32 74, i32 68, i32 109, i32 165, i32 136,
	i32 7, i32 122, i32 179, i32 122, i32 190, i32 134, i32 15, i32 237,
	i32 238, i32 147, i32 41, i32 31, i32 27, i32 219, i32 164, i32 283,
	i32 24, i32 52, i32 245, i32 108, i32 68, i32 100, i32 114, i32 194,
	i32 273, i32 53, i32 30, i32 40, i32 182, i32 11, i32 211, i32 20,
	i32 103, i32 126, i32 220, i32 38, i32 17, i32 255, i32 62, i32 30,
	i32 257, i32 88, i32 217, i32 66, i32 60, i32 230, i32 280, i32 258,
	i32 221, i32 197, i32 115, i32 123, i32 185, i32 265, i32 152, i32 304,
	i32 78, i32 46, i32 169, i32 175, i32 232, i32 42, i32 92, i32 99,
	i32 125, i32 45, i32 174, i32 241, i32 275, i32 145, i32 107, i32 6,
	i32 145, i32 46, i32 114, i32 277, i32 106, i32 295, i32 234, i32 84,
	i32 135, i32 203, i32 305, i32 147, i32 219, i32 269, i32 112, i32 77,
	i32 188, i32 97, i32 224, i32 287, i32 226, i32 22, i32 10, i32 58,
	i32 159, i32 287, i32 109, i32 179, i32 167, i32 108, i32 297, i32 213,
	i32 83, i32 49, i32 123, i32 56, i32 147, i32 142, i32 157, i32 189,
	i32 23, i32 36, i32 150, i32 35, i32 34, i32 150, i32 229, i32 140,
	i32 86, i32 57, i32 235, i32 294, i32 186, i32 133, i32 180, i32 291,
	i32 244, i32 14, i32 2, i32 183, i32 30, i32 235, i32 127, i32 129,
	i32 127, i32 173, i32 7, i32 19, i32 124, i32 76, i32 26, i32 136,
	i32 221, i32 213, i32 172, i32 242, i32 131, i32 63, i32 191, i32 146,
	i32 29, i32 128, i32 139, i32 143, i32 140, i32 298, i32 110, i32 285,
	i32 141, i32 168, i32 115, i32 166, i32 32, i32 189, i32 185, i32 52,
	i32 173, i32 123, i32 91, i32 286, i32 200, i32 208, i32 199, i32 192,
	i32 144, i32 240, i32 148, i32 110, i32 164, i32 29, i32 63, i32 223,
	i32 109, i32 274, i32 51, i32 237, i32 145, i32 282, i32 257, i32 286,
	i32 161, i32 104, i32 303, i32 194, i32 195, i32 181, i32 102, i32 210,
	i32 184, i32 25, i32 100, i32 126, i32 70, i32 62, i32 120, i32 262,
	i32 247, i32 227, i32 117, i32 18, i32 77, i32 242, i32 138, i32 273,
	i32 185, i32 81, i32 287, i32 302, i32 36, i32 293, i32 88, i32 32,
	i32 299, i32 220, i32 253, i32 307, i32 258, i32 108, i32 92, i32 187,
	i32 39, i32 230, i32 279, i32 292, i32 282, i32 96, i32 16, i32 167,
	i32 165, i32 71, i32 175, i32 79, i32 23, i32 13, i32 240, i32 236,
	i32 89, i32 225, i32 104, i32 120, i32 296, i32 100, i32 96, i32 231,
	i32 39, i32 306, i32 162, i32 83, i32 209, i32 35, i32 28, i32 91,
	i32 302, i32 217, i32 72, i32 254, i32 206, i32 124, i32 274, i32 152,
	i32 89, i32 11, i32 66, i32 3, i32 247, i32 3, i32 248, i32 198,
	i32 9, i32 171, i32 95, i32 271, i32 207, i32 172, i32 212, i32 170,
	i32 246, i32 13, i32 64, i32 222, i32 271, i32 49, i32 244, i32 82,
	i32 105, i32 168, i32 60, i32 212, i32 127, i32 76, i32 28, i32 237,
	i32 198, i32 50, i32 277, i32 118, i32 205, i32 275, i32 105, i32 187,
	i32 113, i32 220, i32 252, i32 190, i32 262, i32 12, i32 260, i32 281,
	i32 75, i32 289, i32 299, i32 216, i32 111, i32 228, i32 141, i32 61,
	i32 113, i32 41, i32 33, i32 36, i32 107, i32 144, i32 57, i32 101,
	i32 292, i32 203, i32 204, i32 45, i32 252, i32 97, i32 196, i32 159,
	i32 58, i32 137, i32 224, i32 141, i32 261, i32 64, i32 265, i32 275,
	i32 90, i32 228, i32 268, i32 184, i32 93, i32 165, i32 48, i32 1,
	i32 201, i32 270, i32 283, i32 170, i32 260, i32 119, i32 259, i32 27,
	i32 106, i32 117, i32 187, i32 205, i32 9, i32 205, i32 80, i32 194,
	i32 55, i32 196, i32 98, i32 115, i32 303, i32 120, i32 154, i32 207,
	i32 60, i32 99, i32 116, i32 215, i32 43, i32 263, i32 69, i32 43,
	i32 298, i32 244, i32 298, i32 243, i32 74, i32 119, i32 278, i32 290,
	i32 45, i32 302, i32 294, i32 24, i32 94, i32 169, i32 177, i32 6,
	i32 2, i32 284, i32 3, i32 240, i32 272, i32 261, i32 253, i32 228,
	i32 252, i32 26, i32 210, i32 34, i32 283, i32 25, i32 79, i32 20,
	i32 276, i32 309, i32 155, i32 55, i32 70, i32 161, i32 227, i32 87,
	i32 232, i32 84, i32 167, i32 162, i32 157, i32 65, i32 254, i32 245,
	i32 191, i32 64, i32 296, i32 176, i32 47, i32 288, i32 146, i32 201,
	i32 89, i32 135, i32 8, i32 54, i32 168, i32 154, i32 19, i32 249,
	i32 256, i32 133, i32 233, i32 32, i32 51, i32 199, i32 304, i32 263,
	i32 243, i32 235, i32 111, i32 128, i32 256, i32 177, i32 130, i32 50,
	i32 126, i32 94, i32 17, i32 143, i32 9, i32 257, i32 44, i32 142,
	i32 5, i32 42, i32 243, i32 174, i32 266, i32 12, i32 193, i32 299,
	i32 99, i32 23, i32 279, i32 121, i32 211, i32 253, i32 13, i32 295,
	i32 92, i32 53, i32 149, i32 285, i32 247, i32 274, i32 190, i32 239,
	i32 156, i32 181, i32 269, i32 289, i32 182, i32 61, i32 183, i32 41,
	i32 246, i32 59
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ 0ccdc57cf7fc59bd3f6cbf900c9cdbebadfe4609"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
